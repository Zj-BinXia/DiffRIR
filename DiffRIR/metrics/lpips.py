import cv2
import numpy as np
import torch
import torch.nn.functional as F

from basicsr.metrics.metric_util import reorder_image, to_y_channel
from basicsr.utils.color_util import rgb2ycbcr_pt
from basicsr.utils.registry import METRIC_REGISTRY
import lpips
from torchvision.transforms.functional import normalize
from basicsr.utils import img2tensor

mean = [0.5, 0.5, 0.5]
std = [0.5, 0.5, 0.5]

@METRIC_REGISTRY.register()
def calculate_lpips(img, img2, input_order='HWC',  **kwargs):
    """Calculate PSNR (Peak Signal-to-Noise Ratio).

    Ref: https://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio

    Args:
        img (ndarray): Images with range [0, 255].
        img2 (ndarray): Images with range [0, 255].
        crop_border (int): Cropped pixels in each edge of an image. These pixels are not involved in the calculation.
        input_order (str): Whether the input order is 'HWC' or 'CHW'. Default: 'HWC'.
        test_y_channel (bool): Test on Y channel of YCbCr. Default: False.

    Returns:
        float: PSNR result.
    """

    assert img.shape == img2.shape, (f'Image shapes are different: {img.shape}, {img2.shape}.')
    if input_order not in ['HWC', 'CHW']:
        raise ValueError(f'Wrong input_order {input_order}. Supported input_orders are "HWC" and "CHW"')
    img_gt = reorder_image(img, input_order=input_order).astype(
            np.float32) /255.
    img_restored = reorder_image(img2, input_order=input_order).astype(
            np.float32) /255.
    img_gt, img_restored = img2tensor([img_gt, img_restored], bgr2rgb=True, float32=True)
    # norm to [-1, 1]
    normalize(img_gt, mean, std, inplace=True)
    normalize(img_restored, mean, std, inplace=True)
    # calculate lpips
    loss_fn_vgg = lpips.LPIPS(net='vgg',verbose=False).cuda(0)
    lpips_val = loss_fn_vgg(img_restored.unsqueeze(0).cuda(0), img_gt.unsqueeze(0).cuda(0)).cpu().data.numpy()[0,0,0,0]

    return lpips_val


