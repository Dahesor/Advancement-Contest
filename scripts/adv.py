import json
import os
from adv_.data import get_data

# 在这里列出所有需要修改的命名空间路径及其对应的参数
# 格式: (命名空间路径, 参数)
NAMESPACE_PARAMS = get_data()

# 基础目录结构
BASE_DATA_DIR = "./data"
ADVANCEMENTS_DIR = "advancement"
FUNCTIONS_DIR = "dsc_adv/function"  # 函数文件目录
DEFAULT_NAMESPACE = "minecraft"  # 默认命名空间
SCORE_TRANSLATE_KEY = "dsc.adv.score"  # 分数翻译键
RECEIVE_FUNCTION = "dsc:module/adv_mod/rewards/recieve"  # 接收函数路径

def namespace_to_file_path(namespace_path, file_type="advancement"):
    """将命名空间路径转换为实际文件路径"""
    try:
        # 检查是否包含命名空间
        if ":" in namespace_path:
            # 分割命名空间和路径部分
            namespace, path = namespace_path.split(":", 1)
        else:
            # 使用默认命名空间
            namespace = DEFAULT_NAMESPACE
            path = namespace_path

        # 确保路径不以斜杠开头
        path = path.lstrip("/")

        # 将路径中的斜杠转换为当前系统的路径分隔符
        path = path.replace("/", os.sep)

        # 构建完整文件路径
        if file_type == "advancement":
            return os.path.join(
                BASE_DATA_DIR,
                namespace,
                ADVANCEMENTS_DIR,
                f"{path}.json"
            )
        elif file_type == "function":
            return os.path.join(
                BASE_DATA_DIR,
                FUNCTIONS_DIR,
                namespace,
                f"{path}.mcfunction"
            )
        else:
            raise ValueError(f"未知的文件类型: {file_type}")

    except Exception as e:
        raise ValueError(f"无效的命名空间路径格式: '{namespace_path}' ({str(e)})")

def parse_namespace_path(namespace_path):
    """解析命名空间路径，返回命名空间和路径部分"""
    if ":" in namespace_path:
        return namespace_path.split(":", 1)
    return DEFAULT_NAMESPACE, namespace_path

def create_function_file(function_path, full_ns_path, param):
    """创建函数文件"""
    try:
        # 确保目录存在
        os.makedirs(os.path.dirname(function_path), exist_ok=True)

        # 创建函数内容
        function_content = f"function {RECEIVE_FUNCTION} {{namespace:\"{full_ns_path}\",score:\"{param}\"}}"

        # 写入文件
        with open(function_path, 'w', encoding='utf-8') as f:
            f.write(function_content)

        print(f"✓ 已创建函数文件: {function_path}")
        return True

    except Exception as e:
        print(f"✗ 创建函数文件 {function_path} 时出错: {str(e)}")
        return False

def modify_description(description, param):
    """修改描述字段，添加或更新分数显示"""
    new_component = {
        "translate": SCORE_TRANSLATE_KEY,
        "with": [{
            "text":param,
            "color": "yellow"
        }],
        "color":"yellow"
    }

    # 如果描述是字典（单一组件），转换为列表
    if isinstance(description, dict):
        return [description, new_component]

    # 如果描述是列表
    if isinstance(description, list):
        # 检查最后一个组件是否是分数组件
        if description and isinstance(description[-1], dict):
            last_component = description[-1]

            # 如果已经是分数组件，更新它的参数
            if last_component.get("translate") == SCORE_TRANSLATE_KEY:
                last_component["with"] = [{
                        "text":param,
                        "color": "yellow"
                    }]
                last_component["color"] = "yellow"
                return description

        # 否则添加新的分数组件
        return description + [new_component]

    # 其他类型（字符串等）的处理
    # 创建一个包含原始文本和新组件的列表
    return [
        {"text": str(description)},
        new_component
    ]

def modify_json(file_path, full_ns_path, param):
    """修改JSON文件，添加/更新rewards.function和display.description字段"""
    try:
        # 检查文件是否存在
        if not os.path.exists(file_path):
            print(f"⚠ 成就文件不存在: {file_path}")
            return False

        # 读取JSON文件
        with open(file_path, 'r', encoding='utf-8') as f:
            data = json.load(f)

        # 1. 创建函数标识符
        namespace, path = parse_namespace_path(full_ns_path)
        function_identifier = f"dsc_adv:{namespace}/{path}"

        # 2. 添加/修改rewards.function字段
        rewards = data.get('rewards', {})
        if not isinstance(rewards, dict):
            rewards = {}  # 如果rewards不是字典类型则重置

        rewards['function'] = function_identifier
        data['rewards'] = rewards

        # 3. 修改display.description字段
        display = data.get('display', {})
        if not isinstance(display, dict):
            display = {}

        if 'description' in display:
            display['description'] = modify_description(display['description'], param)
        else:
            # 如果description不存在，创建它
            display['description'] = [{
                "translate": SCORE_TRANSLATE_KEY,
                "with": [param]
            }]

        data['display'] = display

        # 写回文件
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=4, ensure_ascii=False)
            f.write('\n')  # 添加文件尾换行符

        print(f"✓ 已更新成就文件: {file_path}")
        print(f"  函数标识符: {function_identifier}")
        print(f"  分数参数: {param}")
        return True

    except json.JSONDecodeError:
        print(f"✗ JSON解析错误: {file_path} (文件可能不是有效的JSON格式)")
    except Exception as e:
        print(f"✗ 处理成就文件 {file_path} 时出错: {str(e)}")
    return False

if __name__ == "__main__":
    print("开始处理成就文件...")
    print(f"基础数据目录: {os.path.abspath(BASE_DATA_DIR)}")
    print(f"成就目录: {ADVANCEMENTS_DIR}")
    print(f"函数目录: {FUNCTIONS_DIR}")
    print(f"默认命名空间: {DEFAULT_NAMESPACE}")
    print(f"分数翻译键: {SCORE_TRANSLATE_KEY}")
    print(f"接收函数: {RECEIVE_FUNCTION}\n")

    total_files = len(NAMESPACE_PARAMS)
    success_count = 0
    missing_adv_files = []
    created_function_files = []

    for ns_path, param in NAMESPACE_PARAMS:
        try:
            # 获取完整命名空间路径（用于函数内容）
            if ":" in ns_path:
                full_ns_path = ns_path
            else:
                full_ns_path = f"{DEFAULT_NAMESPACE}:{ns_path}"

            # 1. 创建函数文件
            function_path = namespace_to_file_path(ns_path, "function")
            if create_function_file(function_path, full_ns_path, param):
                created_function_files.append(function_path)

                # 2. 修改成就文件
                adv_file_path = namespace_to_file_path(ns_path, "advancement")
                if modify_json(adv_file_path, full_ns_path, param):
                    success_count += 1
                elif not os.path.exists(adv_file_path):
                    missing_adv_files.append(adv_file_path)

        except Exception as e:
            print(f"✗ 处理命名空间路径 '{ns_path}' 时出错: {str(e)}")

    print(f"\n处理完成! 共处理 {total_files} 个成就")
    print(f"成功: {success_count} | 失败: {total_files - success_count}")

    if created_function_files:
        print("\n创建的函数文件:")
        for path in created_function_files:
            print(f"  - {path}")

    if missing_adv_files:
        print("\n以下成就文件不存在:")
        for path in missing_adv_files:
            print(f"  - {path}")