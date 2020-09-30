FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
RUN wget -qO https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add -
RUN apt-get update \
    && apt-get install -y wget \
                vim \
                cmake \
    && wget https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O ~/anaconda3.sh \
    && bash ~/anaconda3.sh -b -p /home/anaconda3 \
    && rm ~/anaconda3.sh
ENV PATH /home/anaconda3/bin:$PATH
RUN mkdir ~/.pip \
    && cd ~/.pip \
    && /home/anaconda3/bin/pip install --upgrade pip \
    && /home/anaconda3/bin/pip install -U pillow \
    && /home/anaconda3/bin/pip --default-timeout=1000 install msgpack msgpack-python easydict opencv-contrib-python==4.0.0.21 Cython h5py lmdb mahotas pandas requests bs4 matplotlib lxml \
    && /home/anaconda3/bin/pip install keras==2.1.5 tensorflow==1.8 tensorflow-gpu==1.8
RUN /home/anaconda3/bin/pip install web.py==0.40.dev0 redis
RUN conda install pytorch torchvision -c pytorch
RUN /home/anaconda3/bin/pip install torch torchvision
RUN /home/anaconda3/bin/pip install paramiko pycrypto uliengineering
WORKDIR /root
