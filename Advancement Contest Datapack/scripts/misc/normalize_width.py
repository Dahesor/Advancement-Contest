import json
from pathlib import Path
from typing import Dict, Union, Optional
import math

def normalize_width(source_dir: Path, target_dir: Path, width_json: Path, fillup: int, scale: float = 1.0):
    """
    规范化JSON文件中字符串的宽度，通过添加空格使每个字符串达到指定宽度
    
    Args:
        source_dir: 源JSON文件目录
        target_dir: 目标输出目录
        width_json: 字符宽度映射JSON文件（存储小数宽度）
        fillup: 目标宽度值
        scale: 宽度缩放系数，从width.json读取的宽度会乘以这个系数
    """
    # 读取字符宽度映射
    with open(width_json, 'r', encoding='utf-8') as f:
        raw_widths: Dict[str, Union[int, float]] = json.load(f)
    
    # 应用缩放系数，转换为浮点数
    char_widths: Dict[str, float] = {}
    for char, width in raw_widths.items():
        char_widths[char] = float(width) * scale
    
    # 确保目标目录存在
    target_dir.mkdir(parents=True, exist_ok=True)
    
    # 遍历源目录中的所有JSON文件
    for json_file in source_dir.glob("*.json"):
        try:
            # 读取源JSON文件
            with open(json_file, 'r', encoding='utf-8') as f:
                data = json.load(f)
            
            # 处理每个key（删除第一个字符）和对应的value
            processed_data = process_json_keys_and_values(data, char_widths, fillup, json_file.name)
            
            # 写入目标文件
            target_file = target_dir / json_file.name
            with open(target_file, 'w', encoding='utf-8') as f:
                json.dump(processed_data, f, ensure_ascii=False, indent=2)
                
            print(f"已处理: {json_file.name}")
            
        except Exception as e:
            print(f"处理文件 {json_file.name} 时出错: {e}")


def process_json_keys_and_values(data, char_widths: Dict[str, float], fillup: int, filename: str):
    """
    递归处理JSON数据，删除每个key的第一个字符并调整字符串宽度
    """
    if isinstance(data, dict):
        new_dict = {}
        for key, value in data.items():
            # 删除key的第一个字符
            new_key = key[1:] if key and len(key) > 0 else key
            
            # 递归处理value
            if isinstance(value, str):
                new_dict[new_key] = adjust_string_width(value, char_widths, fillup, filename)
            elif isinstance(value, (dict, list)):
                new_dict[new_key] = process_json_keys_and_values(value, char_widths, fillup, filename)
            else:
                new_dict[new_key] = value  # 非字符串、非容器类型直接复制
        return new_dict
    
    elif isinstance(data, list):
        new_list = []
        for item in data:
            if isinstance(item, (dict, list)):
                new_list.append(process_json_keys_and_values(item, char_widths, fillup, filename))
            elif isinstance(item, str):
                new_list.append(adjust_string_width(item, char_widths, fillup, filename))
            else:
                new_list.append(item)
        return new_list
    
    else:
        return data  # 基本类型直接返回


def adjust_string_width(text: str, char_widths: Dict[str, float], fillup: int, filename: str) -> str:
    """
    调整单个字符串的宽度，使其达到目标宽度
    """
    if not text:
        return text
    
    # 计算当前字符串的总宽度（使用浮点数）
    total_width = 0.0
    for i, char in enumerate(text):
        # 获取字符宽度，如果未定义则默认为0
        char_width = char_widths.get(char, 0.0)
        char_width = math.ceil(char_width)  # 向上取整，确保宽度为整数
        total_width += char_width
        
        # 如果不是最后一个字符，添加分割宽度
        if i < len(text) - 1:
            total_width += 1  # 字符间的分割宽度
    
    # 如果当前宽度小于目标宽度，添加空格
    if total_width < fillup - 1e-9:  # 使用小的容差值处理浮点数精度问题
        needed_width = fillup - total_width
        
        # 获取空格宽度，确保不为0
        space_width = 4
        if space_width <= 1e-9:  # 如果空格宽度为0或接近0，使用默认值
            space_width = 5.0
        
        # 获取宽度为1的字符宽度
        one_width_char = '\uE779'
        one_width = 0.5
        
        # 计算需要添加的空格数量
        # 使用整数除法，避免除零错误
        space_count = 0
        if space_width > 1e-9:
            space_count = int(needed_width // space_width)
        
        # 确保空格数量不超过合理范围
        space_count = min(space_count, 1000)  # 添加一个合理的上限
        
        spaces = " " * space_count
        
        # 计算剩余宽度
        remaining_width = needed_width - (space_count * space_width)
        
        # 如果还有剩余宽度，使用宽度为1的字符进行精确调整
        if remaining_width > 1e-9 and one_width > 1e-9:  # 大于0且one_width不为0
            # 计算需要多少个宽度为1的字符
            one_width_count = int(round(remaining_width / one_width))
            one_width_count = min(one_width_count, 100)  # 添加一个合理的上限
            if one_width_count > 0:
                spaces += one_width_char * one_width_count
        
        return text + spaces
    
    # 如果当前宽度大于目标宽度，打印警告（使用浮点数比较）
    elif total_width > fillup + 1e-9:
        print(f"警告: 文件 '{filename}' 中的字符串 '{text[:30]}...' 宽度 {total_width:.2f} 超过目标宽度 {fillup}")
    
    return text


def print_widths_info(char_widths: Dict[str, float], sample_chars: Optional[list] = None):
    """
    辅助函数：打印字符宽度信息，用于调试
    """
    if sample_chars is None:
        sample_chars = [' ', '!', '"', '#', '$', '%', 'A', 'B', 'C', '\uE779']
    
    print("字符宽度信息（已缩放）：")
    for char in sample_chars:
        if char in char_widths:
            display_char = char if char != '\uE779' else '\\uE779'
            print(f"  '{display_char}': {char_widths[char]:.2f}")
        else:
            display_char = char if char != '\uE779' else '\\uE779'
            print(f"  '{display_char}': 未定义")


def debug_width_calculation(text: str, char_widths: Dict[str, float], filename: str = ""):
    """
    调试函数：打印字符串中每个字符的宽度计算详情
    """
    print(f"\n调试字符串宽度计算: '{text}'")
    total = 0.0
    for i, char in enumerate(text):
        width = char_widths.get(char, 0.0)
        total += width
        print(f"  字符 {i}: '{char}' - 宽度 {width:.2f}")
        if i < len(text) - 1:
            total += 1.0
            print(f"  字符间分割: 宽度 1.00")
    print(f"  总宽度: {total:.2f}")
    return total

# 使用示例

if __name__ == "__main__":
    source = Path("../../../../resourcepacks/Survival Competition Resources/lang/assets/task/lang")
    target = Path("../../../../resourcepacks/Survival Competition Resources/lang/assets/task_f/lang")
    width_file = Path("./scripts/__data/width.json")
    
    normalize_width(source, target, width_file, fillup=120, scale=0.5)


