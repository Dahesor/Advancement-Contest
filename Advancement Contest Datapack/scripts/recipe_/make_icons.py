from __future__ import annotations

import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Tuple, Optional, Literal

from PIL import Image

_SI_KEY_RE = re.compile(r"^si\.([0-9A-Za-z|_]+)$")

AtlasKind = Literal["a", "b"]  # a: source_image_dir, b: source_render_dir


@dataclass
class AtlasSpec:
    kind: AtlasKind                # "a" or "b"
    prefix: str                    # "recipe"
    file_index: int                # 0,1,2...
    cell_size: int                 # 16 for a, 32 for b
    grid_cols: int                 # 16 for a (256/16), 16 for b (512/32)
    grid_rows: int                 # 16 for a, 16 for b
    width: int                     # 256 or 512
    height: int                    # 256 or 512
    base_codepoint: int            # 0xE000 for a, 0xF000 for b
    image: Image.Image             # RGBA atlas image
    placed_count: int              # how many cells filled so far

    def filename(self) -> str:
        # recipe_0a.png / recipe_1b.png ...
        return f"{self.prefix}_{self.file_index:01d}{self.kind}.png"

    def full_path(self, output_dir: Path) -> Path:
        return output_dir / self.filename()

    def is_full(self) -> bool:
        return self.placed_count >= (self.grid_cols * self.grid_rows)

    def next_cell_xy(self) -> Tuple[int, int, int, int]:
        """
        Returns (row, col, x, y) for where the next icon will go.
        """
        col = self.placed_count % self.grid_cols
        row = self.placed_count // self.grid_cols
        x = col * self.cell_size
        y = row * self.cell_size
        return row, col, x, y

    def codepoint_for(self, row: int, col: int) -> int:
        """
        Encoding: \\u<E/F><file><row><col> as a single private-use character
        codepoint = base + (file<<8) + (row<<4) + col
        """
        if not (0 <= self.file_index <= 15):
            raise ValueError(f"file_index too large for \\u<E/F><file><row><col> encoding: {self.file_index}")
        if not (0 <= row <= 15 and 0 <= col <= 15):
            raise ValueError(f"row/col out of range (0..15): row={row}, col={col}")
        return self.base_codepoint + (self.file_index << 8) + (row << 4) + col


def _new_atlas(spec: AtlasSpec) -> Image.Image:
    return Image.new("RGBA", (spec.width, spec.height), (0, 0, 0, 0))


def _ensure_right_edge_mark(atlas: Image.Image, cell_x: int, cell_y: int, cell_size: int) -> None:
    """
    Check the right-most column of this cell.
    If all alpha==0, set bottom-right pixel to white with alpha=1 (1/255).
    """
    if atlas.mode != "RGBA":
        raise ValueError(f"atlas must be RGBA, got {atlas.mode}")

    right_x = cell_x + (cell_size - 1)

    for dy in range(cell_size):
        p = atlas.getpixel((right_x, cell_y + dy))
        if isinstance(p, tuple):
            a = p[3] if len(p) >= 4 else 255
        else:
            # For RGBA this shouldn't happen, but keep Pylance + runtime safe.
            a = 255
        if a != 0:
            return

    atlas.putpixel((cell_x + (cell_size - 1), cell_y + (cell_size - 1)), (255, 255, 255, 1))


def _load_icon(path: Path, target_size: int) -> Optional[Image.Image]:
    """
    Load image as RGBA and resize to target_size x target_size using NEAREST if needed.
    """
    try:
        img = Image.open(path).convert("RGBA")
    except Exception as e:
        print(f"[LOAD FAIL] {path}: {e}")
        return None

    if img.size != (target_size, target_size):
        img = img.resize((target_size, target_size), resample=Image.Resampling.NEAREST)
    return img


def _get_or_create_atlas(
    atlases: Dict[AtlasKind, AtlasSpec],
    kind: AtlasKind,
    output_dir: Path,
    prefix: str,
) -> AtlasSpec:
    """
    Ensure there is a current (not-full) atlas for this kind.
    If current is full, save it and create the next file_index atlas.
    """
    spec = atlases.get(kind)
    if spec is None:
        # create first
        if kind == "a":
            spec = AtlasSpec(
                kind="a", prefix=prefix, file_index=0,
                cell_size=16, grid_cols=16, grid_rows=16,
                width=256, height=256, base_codepoint=0xE000,
                image=Image.new("RGBA", (256, 256), (0, 0, 0, 0)),
                placed_count=0,
            )
        else:
            spec = AtlasSpec(
                kind="b", prefix=prefix, file_index=0,
                cell_size=32, grid_cols=16, grid_rows=16,
                width=512, height=512, base_codepoint=0xF000,
                image=Image.new("RGBA", (512, 512), (0, 0, 0, 0)),
                placed_count=0,
            )
        atlases[kind] = spec
        return spec

    if spec.is_full():
        # save and roll to next file index
        out_path = spec.full_path(output_dir)
        out_path.parent.mkdir(parents=True, exist_ok=True)
        spec.image.save(out_path, format="PNG")

        next_index = spec.file_index + 1
        if next_index > 15:
            # Because encoding stores file index in one hex nibble.
            raise ValueError(f"[NO SPACE] Too many atlas files for kind={kind}. Max is 16 (0..15).")

        if kind == "a":
            new_spec = AtlasSpec(
                kind="a", prefix=prefix, file_index=next_index,
                cell_size=16, grid_cols=16, grid_rows=16,
                width=256, height=256, base_codepoint=0xE000,
                image=Image.new("RGBA", (256, 256), (0, 0, 0, 0)),
                placed_count=0,
            )
        else:
            new_spec = AtlasSpec(
                kind="b", prefix=prefix, file_index=next_index,
                cell_size=32, grid_cols=16, grid_rows=16,
                width=512, height=512, base_codepoint=0xF000,
                image=Image.new("RGBA", (512, 512), (0, 0, 0, 0)),
                placed_count=0,
            )

        atlases[kind] = new_spec
        return new_spec

    return spec


def _finalize_all_atlases(atlases: Dict[AtlasKind, AtlasSpec], output_dir: Path) -> None:
    """
    Save all atlases that have been created (even if empty? we'll save only if placed_count>0).
    """
    output_dir.mkdir(parents=True, exist_ok=True)
    for spec in atlases.values():
        if spec.placed_count > 0:
            spec.image.save(spec.full_path(output_dir), format="PNG")


def make_icons(parsing_file: Path, output_dir: Path, source_image_dir: Path, source_render_dir: Path):
    """
    output_dir contains:
      recipe_0a.png (256x256, 16x16 cells, from source_image_dir)
      recipe_0b.png (512x512, 32x32 cells, from source_render_dir)
      and if filled: recipe_1a.png / recipe_1b.png ...

    JSON value rewrite:
      - If placed in kind 'a': codepoint base 0xE000 -> \\uE<file><row><col>
      - If placed in kind 'b': codepoint base 0xF000 -> \\uF<file><row><col>

    Examples:
      recipe_1a at row=8, col=2 -> \\uE182
      recipe_0b at row=0, col=4 -> \\uF004
    """
    parsing_file = Path(parsing_file)
    output_dir = Path(output_dir)
    source_image_dir = Path(source_image_dir)
    source_render_dir = Path(source_render_dir)

    if not parsing_file.exists():
        raise FileNotFoundError(f"parsing_file not found: {parsing_file}")

    # load json
    with parsing_file.open("r", encoding="utf-8") as f:
        data = json.load(f)

    if not isinstance(data, dict):
        raise ValueError("parsing_file root must be a JSON object")
    for k, v in data.items():
        if not isinstance(k, str) or not isinstance(v, str):
            raise ValueError("parsing_file must be an object whose keys and values are strings")

    atlases: Dict[AtlasKind, AtlasSpec] = {}
    prefix = "recipe"

    for key in list(data.keys()):
        m = _SI_KEY_RE.match(key)
        if not m:
            continue
        prev_value = data[key]
        if not isinstance(prev_value,str):
            continue
        if re.match(r"\\u[eE][fFeE]",prev_value.encode("unicode_escape").decode()):
            continue

        name = m.group(1)
        filename = f"{name}.png"

        # ---- choose source and target atlas kind
        path_a = source_image_dir / filename
        path_b = source_render_dir / filename

        kind: Optional[AtlasKind] = None
        img: Optional[Image.Image] = None
        chosen_path: Optional[Path] = None

        if path_a.exists():
            kind = "a"
            img = _load_icon(path_a, target_size=16)
            chosen_path = path_a
        elif path_b.exists():
            kind = "b"
            img = _load_icon(path_b, target_size=32)
            chosen_path = path_b
        else:
            print(f"[MISSING] {key}: not found in either dir: {path_a} OR {path_b}")
            continue

        if img is None:
            # load fail already printed
            continue

        spec = _get_or_create_atlas(atlases, kind, output_dir, prefix)

        if spec.is_full():
            # _get_or_create_atlas should have rolled, but keep a hard guard
            print(f"[NO SPACE] Atlas unexpectedly full for kind={kind}. Cannot place: {chosen_path}")
            continue

        row, col, x, y = spec.next_cell_xy()

        # paste
        spec.image.paste(img, (x, y))

        # right-edge mark (cell_size depends on atlas kind)
        _ensure_right_edge_mark(spec.image, x, y, spec.cell_size)

        # write codepoint into json
        cp = spec.codepoint_for(row, col)
        data[key] = chr(cp)

        spec.placed_count += 1

    # save atlases
    _finalize_all_atlases(atlases, output_dir)

    # write back json
    with parsing_file.open("w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=True, indent=2)
        f.write("\n")

def main():
    parsing = Path("../../../../resourcepacks/Survival Competition Resources/lang/assets/si/lang/en_us.json")
    to_img_dir = Path("../../../../resourcepacks/Survival Competition Resources/assets/dsc/textures/font/dec/")
    item_img_dir = Path("C:/ProgramData/MCDATA/assets/minecraft/textures/item")
    block_img_dir = Path("C:/ProgramData/MCDATA/render")
    make_icons(parsing, to_img_dir, item_img_dir,block_img_dir)

if __name__ == "__main__":
    main()