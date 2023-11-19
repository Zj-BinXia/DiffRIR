# CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
# python3 -m torch.distributed.launch --nproc_per_node=8 --master_port=4397 DiffRIR/train.py -opt options/train_DiffRIRS2_GAN_x4_V2.yml --launcher pytorch

# CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
# python3 -m torch.distributed.launch --nproc_per_node=8 --master_port=4397 DiffRIR/train.py -opt options/train_DiffRIRS2_GAN_x2_V2.yml --launcher pytorch

CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
python3 -m torch.distributed.launch --nproc_per_node=8 --master_port=4397 DiffRIR/train.py -opt options/train_DiffRIRS2_GAN_x1_V2.yml --launcher pytorch
