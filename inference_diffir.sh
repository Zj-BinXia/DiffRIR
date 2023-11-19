# CUDA_VISIBLE_DEVICES=0 python3 inference_diffir.py \
#     --im_path /mnt/bn/xiabinpaint/CVPR2024v4/diffusers/exp-outpainting/my_SD15_7b_thick_llmga \
#     --mask_path /mnt/bn/inpainting-bytenas-lq/xiabin/Place2/outpainting_mask_thick \
#     --res_path /mnt/bn/xiabinpaint/CVPR2024v4/exp-edit/outpainting-ir/my_SD15_7b_thick_llmga

# CUDA_VISIBLE_DEVICES=0 python3 inference_diffir.py \
#     --im_path /mnt/bn/xiabinpaint/CVPR2024v4/diffusers/exp-outpainting/my_SD15_13b_thick_llmga \
#     --mask_path /mnt/bn/inpainting-bytenas-lq/xiabin/Place2/outpainting_mask_thick \
#     --res_path /mnt/bn/xiabinpaint/CVPR2024v4/exp-edit/outpainting-ir/my_SD15_13b_thick_llmga

# CUDA_VISIBLE_DEVICES=1 python3 inference_diffir.py \
#     --im_path /mnt/bn/xiabinpaint/CVPR2024v4/diffusers/exp-outpainting/my_SD15_13b_thin_llmga \
#     --mask_path /mnt/bn/inpainting-bytenas-lq/xiabin/Place2/outpainting_mask_thin \
#     --res_path /mnt/bn/xiabinpaint/CVPR2024v4/exp-edit/outpainting-ir/my_SD15_13b_thin_llmga

# CUDA_VISIBLE_DEVICES=1 python3 inference_diffir.py \
#     --im_path /mnt/bn/xiabinpaint/CVPR2024v4/diffusers/exp-outpainting/my_SD15_7b_thin_llmga \
#     --mask_path /mnt/bn/inpainting-bytenas-lq/xiabin/Place2/outpainting_mask_thin \
#     --res_path /mnt/bn/xiabinpaint/CVPR2024v4/exp-edit/outpainting-ir/my_SD15_7b_thin_llmga

# CUDA_VISIBLE_DEVICES=1 python3 inference_diffir.py \
#     --gt_path /mnt/bn/xiabinpaint/dataset/NTIRE2020-Track1/track1-valid-gt \
#     --im_path /mnt/bn/xiabinpaint/dataset/NTIRE2020-Track1/lrx4_addy \
#     --mask_path /mnt/bn/xiabinpaint/dataset/NTIRE2020-Track1/MASK \
#     --res_path ./exp-edit/ntire2020/v15

CUDA_VISIBLE_DEVICES=1 python3 inference_diffir.py \
    --im_path /mnt/bn/xiabinpaint/CVPR2024v4/diffusers/exp-outpainting/my_SD15_7b_thin_llmga_allsdout \
    --mask_path /mnt/bn/inpainting-bytenas-lq/xiabin/Place2/outpainting_mask_thin \
    --res_path /mnt/bn/xiabinpaint/CVPR2024v4/exp-edit/outpainting-ir/my_SD15_7b_thin_llmga

