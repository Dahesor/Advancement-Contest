import shutil
import os
from reset_.pathes import get_pathes

# 复制数据包副本
def copy_datapack(data_pack_folder, source_folder):
    os.makedirs(data_pack_folder, exist_ok=True)
    if os.path.exists(data_pack_folder):
        shutil.rmtree(data_pack_folder)
    os.makedirs(data_pack_folder)
    shutil.copy("./pack.mcmeta",f'{data_pack_folder}/pack.mcmeta')
    shutil.copytree(f'{source_folder}/data', f'{data_pack_folder}/data')

if __name__ == "__main__":
    (level_dat_path, backup_path, target_folder, data_pack_folder, source_folder) = get_pathes()
    copy_datapack(data_pack_folder=data_pack_folder, source_folder=source_folder)