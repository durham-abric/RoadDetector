# run only on GPU instance and with --ipc=host option
FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

RUN apt-get update --fix-missing && apt-get install -y wget libglib2.0 libsm-dev libxrender-dev libjpeg-dev vim tmux libopenblas-dev libxext-dev
ENV PATH "/miniconda/bin:$PATH"
ENV VERSION 4.3.30
RUN wget https://repo.continuum.io/miniconda/Miniconda3-${VERSION}-Linux-x86_64.sh
RUN chmod +x Miniconda3-${VERSION}-Linux-x86_64.sh
RUN ./Miniconda3-${VERSION}-Linux-x86_64.sh -b -f -p /miniconda
RUN mkdir -p /root/.torch/models
RUN wget https://download.pytorch.org/models/resnet34-333f7ec4.pth -P /root/.torch/models
RUN conda install -y shapely
RUN conda install -y conda=4.4.7
RUN conda install -y osmnx -c conda-forge
RUN conda install -y gdal=2.3.1 libgdal=2.3.1 -c conda-forge
RUN conda install -y torchvision=0.2.0 pytorch=0.3.1 cuda90 -c pytorch
ADD requirements.txt requirements.txt
RUN pip install -r requirements.txt
ENV LD_LIBRARY_PATH /miniconda/lib:${LD_LIBRARY_PATH}
RUN apt install -y libgl1-mesa-glx
ADD weights /results/weights/
ADD ["train.sh", "test.sh", "train_single.sh", "/"]
ADD src /opt/app/src/
RUN conda create -n geo_env -c conda-forge gdal
RUN activate geo_env
