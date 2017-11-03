FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        --no-install-recommends \
        build-essential \
        unzip \
        file \
        git \
        ca-certificates \
        rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY deps/jdk-8u152-linux-x64.tar.gz /deps/
COPY deps/bazel-0.7.0-installer-linux-x86_64.sh /deps/
COPY deps/Miniconda3-4.3.30-Linux-x86_64.sh /deps/

RUN tar zxf /deps/jdk-8u152-linux-x64.tar.gz -C /opt --no-same-owner && \
    echo 'export JAVA_HOME=/opt/jdk1.8.0_152' > /etc/profile.d/java.sh && \
    echo 'export PATH=$PATH:/opt/jdk1.8.0_152/bin' >> /etc/profile.d/java.sh

RUN export JAVA_HOME=/opt/jdk1.8.0_152 && \
    /deps/bazel-0.7.0-installer-linux-x86_64.sh --prefix=/opt/bazel-0.7.0 && \
    echo 'export PATH=$PATH:/opt/bazel-0.7.0/bin' > /etc/profile.d/bazel.sh

RUN bash /deps/Miniconda3-4.3.30-Linux-x86_64.sh -b -f -p /opt/conda && \
    echo 'export PATH=$PATH:/opt/conda/bin' > /etc/profile.d/conda.sh && \
    /opt/conda/bin/conda install -y numpy

RUN rm -rf /deps

RUN useradd -m tensorflow && \
    passwd -d tensorflow

USER tensorflow

COPY 1.4-cpu/build.sh /home/tensorflow

CMD ["/bin/bash"]
