#!/usr/bin/env bash
set -e
arglen=$(($#-1))
args=${@:1:$arglen}
last=${!#}

rm -rf /wdata/*
mkdir /wdata/output_png
pushd /opt/app/src
python create_spacenet_masks.py $args
python train_eval.py resnet34_512_02_02.json
python merge_preds.py
python skeleton.py $last
mv AOI*.png /wdata/output_png
popd
