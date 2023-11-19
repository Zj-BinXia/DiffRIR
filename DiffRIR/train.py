# flake8: noqa
import warnings

warnings.filterwarnings("ignore")
import os.path as osp
from DiffRIR.train_pipeline import train_pipeline

import DiffRIR.archs
import DiffRIR.data
import DiffRIR.models
import DiffRIR.losses


if __name__ == '__main__':
    root_path = osp.abspath(osp.join(__file__, osp.pardir, osp.pardir))
    train_pipeline(root_path)
