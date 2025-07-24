import nbtlib
import random
import shutil

# 路径设置
level_dat_path = 'C:/Users/dahes/AppData/Roaming/.minecraft/versions/Survival Competiton/saves/mod/level.dat'  # 原始文件
backup_path = 'C:/Users/dahes/AppData/Roaming/.minecraft/versions/Survival Competiton/saves/mod/level.dat_old'  # 备份文件

# 备份原始文件
shutil.copyfile(level_dat_path, backup_path)
print(f'✅ 原始文件已备份为: {backup_path}')

# 加载 NBT 数据
nbt_file = nbtlib.load(level_dat_path)
data = nbt_file.root['Data']

# 获取当前种子
old_seed = data['RandomSeed']
print(f'🌱 当前世界种子: {old_seed}')

# 生成新种子
new_seed = random.randint(-2**63, 2**63 - 1)
data['RandomSeed'] = nbtlib.tag.Long(new_seed)
print(f'🆕 替换为新种子: {new_seed}')

# 保存修改
nbt_file.save(level_dat_path)
print('💾 新的 level.dat 已保存！')
