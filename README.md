PARALLEL STEPS IN CODEBASE:

1. Label Roads : 
  1.1. create_spacenet_masks.py /data/test/AOI_3_Paris_Roads_Test_Public <output>
  1.2. train_eval.py resnet34_512_02_02.json
  1.3. merge_preds.py
2. Convert To Global Coordinates & Connect Adjacent Graphs:
  2.1. python skeleton.py <output>
 
 
NOTE: Docker container needs to be configured beyond the Dockerfile build. See Report for packages & versions necessary to run.

The program requires GDAL to operate. GDAL is best used from it's own conda environment (conda create geo -c conda-forge gdal).
