# DiffRIR: Diffusion model for reference image restoration

The DiffRIR is proposed in ["LLMGA: Multimodal Large Language Model based Generation Assistant"](https://arxiv.org/pdf/2311.16500.pdf), and the code is based on [DiffIR](https://github.com/Zj-BinXia/DiffIR).

[Bin Xia](https://scholar.google.com/citations?user=rh2fID8AAAAJ&hl=zh-CN), [Shiyin Wang](), [Yingfan Tao](https://scholar.google.com/citations?user=GYDnPdQAAAAJ&hl=zh-CN&oi=ao), [Yitong Wang](https://scholar.google.com/citations?user=NfFTKfYAAAAJ&hl=zh-CN), and [Jiaya Jia](https://scholar.google.com/citations?user=XPAkzTEAAAAJ&hl=zh-CN&oi=ao)

<a href="https://llmga.github.io/"><img src="https://img.shields.io/badge/Project-Page-Green"></a>
<a href='https://llmga.github.io/'><img src='https://img.shields.io/badge/Project-Demo-violet'></a>
<a href="https://arxiv.org/pdf/2311.16500.pdf"><img src='https://img.shields.io/badge/Paper-Arxiv-red'></a> 

[Paper](https://arxiv.org/pdf/2311.16500.pdf) | [Project Page](https://github.com/Zj-BinXia/DiffRIR) | [pretrained models](https://drive.google.com/drive/folders/18FWpDCE9z3vS9hEvezxROzTz5hwozRiz?usp=drive_link)

## News
[2023.12.19]   🔥 We release [pretrained models](https://drive.google.com/drive/folders/18FWpDCE9z3vS9hEvezxROzTz5hwozRiz?usp=drive_link) for DiffRIR.
[2023.11.19]   🔥 We release all training and inference codes of DiffRIR.

## Abstract
We propose a reference-based restoration network (DiffRIR) to alleviate texture, brightness, and contrast disparities between generated and preserved regions during image editing, such as inpainting and outpainting.

## Training

### 1. Dataset Preparation

We use DF2K (DIV2K and Flickr2K) + OST datasets for our training. Only HR images are required. <br>
You can download from :

1. DIV2K: http://data.vision.ee.ethz.ch/cvl/DIV2K/DIV2K_train_HR.zip
2. Flickr2K: https://cv.snu.ac.kr/research/EDSR/Flickr2K.tar
3. OST: https://openmmlab.oss-cn-hangzhou.aliyuncs.com/datasets/OST_dataset.zip

Here are steps for data preparation.

#### Step 1: [Optional] Generate multi-scale images

For the DF2K dataset, we use a multi-scale strategy, *i.e.*, we downsample HR images to obtain several Ground-Truth images with different scales. <br>
You can use the [scripts/generate_multiscale_DF2K.py](scripts/generate_multiscale_DF2K.py) script to generate multi-scale images. <br>
Note that this step can be omitted if you just want to have a fast try.

```bash
python scripts/generate_multiscale_DF2K.py --input datasets/DF2K/DF2K_HR --output datasets/DF2K/DF2K_multiscale
```

#### Step 2: [Optional] Crop to sub-images

We then crop DF2K images into sub-images for faster IO and processing.<br>
This step is optional if your IO is enough or your disk space is limited.

You can use the [scripts/extract_subimages.py](scripts/extract_subimages.py) script. Here is the example:

```bash
 python scripts/extract_subimages.py --input datasets/DF2K/DF2K_multiscale --output datasets/DF2K/DF2K_multiscale_sub --crop_size 400 --step 200
```

#### Step 3: Prepare a txt for meta information

You need to prepare a txt file containing the image paths. The following are some examples in `meta_info_DF2Kmultiscale+OST_sub.txt` (As different users may have different sub-images partitions, this file is not suitable for your purpose and you need to prepare your own txt file):

```txt
DF2K_HR_sub/000001_s001.png
DF2K_HR_sub/000001_s002.png
DF2K_HR_sub/000001_s003.png
...
```

You can use the [scripts/generate_meta_info.py](scripts/generate_meta_info.py) script to generate the txt file. <br>
You can merge several folders into one meta_info txt. Here is the example:

```bash
 python scripts/generate_meta_info.py --input datasets/DF2K/DF2K_HR datasets/DF2K/DF2K_multiscale --root datasets/DF2K datasets/DF2K --meta_info datasets/DF2K/meta_info/meta_info_DF2Kmultiscale.txt
```

### 2.  Pretrain DiffRIR_S1
```
sh trainS1.sh
```

### 3.  Train DiffRIR_S2

```
#set the 'pretrain_network_g' and 'pretrain_network_S1' in ./options/train_DiffIRS2_x4.yml to be the path of DiffIR_S1's pre-trained model

sh trainS2.sh
```

### 4.  Train DiffRIR_S2_GAN

```
#set the 'pretrain_network_g' and 'pretrain_network_S1' in ./options/train_DiffIRS2_GAN_x4.yml to be the path of DiffRIR_S2 and DiffRIR_S1's trained model, respectively.

sh train_DiffRIRS2_GAN.sh

or

sh train_DiffRIRS2_GANv2.sh
```

**Note:** The above training script uses 8 GPUs by default. 



## Inference
Download the pre-trained [model]() and place it in `./experiments/`

```
python3  inference_diffir.py --im_path PathtoLR --res_path ./outputs --model_path Pathto4xModel --scale 4

python3  inference_diffir.py --im_path PathtoLR --res_path ./outputs --model_path Pathto2xModel --scale 2

python3  inference_diffir.py --im_path PathtoLR --res_path ./outputs --model_path Pathto1xModel --scale 1
```





