from PIL import Image
import numpy as np

img = Image.open("./scripts/misc/input.png").convert("RGB")
arr = np.array(img).astype(np.float32)

# 计算亮度（黑色接近0，紫色较高）
brightness = arr.max(axis=2)

# 生成 alpha
alpha = brightness

# 避免除0
alpha_safe = np.where(alpha == 0, 1, alpha)

# 去掉黑色背景（反向预乘）
rgb = arr / (alpha_safe[..., None] / 255.0)

rgb = np.clip(rgb, 0, 255)

rgba = np.dstack([rgb, alpha])

Image.fromarray(rgba.astype(np.uint8), "RGBA").save("output.png")