#!/usr/bin/env bash

mkdir 2m_4fold_512_30e_d0.2_g0.2
aws s3 sync s3://spacenet-dataset/spacenet-model-weights/spacenet-3/01-Albu/weights/ 2m_4fold_512_30e_d0.2_g0.2
