import nbtlib
import random
import shutil
import os
from reset_.pathes import get_pathes
from reload import copy_datapack


def reset_world(level_dat_path, backup_path, target_folder):
    # 备份原始文件
    shutil.copyfile(level_dat_path, backup_path)
    print(f'✅ 原始文件已备份为: {backup_path}')
    # 加载 NBT 数据
    nbt_file = nbtlib.load(level_dat_path)
    data = nbt_file['Data']  # 修改此行

    # 生成新种子
    new_seed = random.randint(-2**63, 2**63 - 1)
    data['WorldGenSettings']['seed'] = nbtlib.tag.Long(new_seed)
    print(f'🆕 替换为新种子: {new_seed}')

    # 删除玩家数据
    del data['Player']

    # 保存修改
    nbt_file.save(level_dat_path)
    print('💾 新的 level.dat 已保存！')
    # 遍历文件夹
    for item in os.listdir(target_folder):
        full_path = os.path.join(target_folder, item)
        # 如果不是 level.dat，就删除
        if item != 'level.dat':
            try:
                if os.path.isfile(full_path) or os.path.islink(full_path):
                    os.remove(full_path)
                elif os.path.isdir(full_path):
                    shutil.rmtree(full_path)
            except Exception as e:
                print(f'⚠️ 删除失败: {full_path}，错误: {e}')

if __name__ == "__main__":
    (level_dat_path, backup_path, target_folder, data_pack_folder, source_folder) = get_pathes()
    reset_world(level_dat_path=level_dat_path, backup_path=backup_path, target_folder=target_folder)
    copy_datapack(data_pack_folder=data_pack_folder, source_folder=source_folder)