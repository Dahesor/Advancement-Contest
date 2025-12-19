import nbtlib
import random
import shutil
import os
from reset_.pathes import get_pathes

def reset_world(world_folder, data_pack_folder, source_folder):
    assert 'level.dat' in os.listdir(world_folder)
    # 加载 NBT 数据
    level_data_path = os.path.join(world_folder, 'level.dat')
    nbt_file = nbtlib.load(level_data_path)
    data = nbt_file['Data']  # 修改此行

    # 生成新种子
    new_seed = random.randint(-2**63, 2**63 - 1)
    data['WorldGenSettings']['seed'] = nbtlib.tag.Long(new_seed)
    data['DayTime'] = nbtlib.tag.Long(2000)
    print(f'🆕 替换为新种子: {new_seed}')
    # 删除玩家数据
    try:
        del data['Player']
    except KeyError:
        pass
    # 保存修改
    nbt_file.save(level_data_path)
    print('💾 新的 level.dat 已保存！')
    # 遍历文件夹
    for item in os.listdir(world_folder):
    # 白名单
        if item in ('level.dat', 'datapacks'):
            continue
        full_path = os.path.join(world_folder, item)
        if item in ('advancements','data','DIM1','DIM-1','stats','entities','playerdata','poi','region','session.lock'):
            try:
                if os.path.isfile(full_path) or os.path.islink(full_path):
                    os.remove(full_path)
                elif os.path.isdir(full_path):
                    shutil.rmtree(full_path)
            except Exception as e:
                print(f'⚠️ 删除失败: {full_path}，错误: {e}')

if __name__ == "__main__":
    (world_folder, data_pack_folder, source_folder) = get_pathes()
    reset_world(world_folder, data_pack_folder, source_folder)