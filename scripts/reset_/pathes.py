from pathlib import Path

def get_pathes():
    world_folder = (Path.cwd() / "../..").resolve()
    data_pack_folder = (Path.cwd() / "../").resolve()
    source_folder = (Path.cwd() / ".").resolve()
    print(str(world_folder))
    return (str(world_folder), str(data_pack_folder), str(source_folder))