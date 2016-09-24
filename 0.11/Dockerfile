FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        --no-install-recommends \
        build-essential \
        python-dev \
        python-wheel \
        python-setuptools \
        python-numpy \
        swig \
        zlib1g-dev \
        unzip \
        file \
        git \
        ca-certificates \
        rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY build_deps/ /build_deps/

RUN /build_deps/cuda_8.0.27_linux.run --silent --toolkit --override && \
    /build_deps/cuda_8.0.27.1_linux.run --silent --accept-eula && \
    tar zxf /build_deps/cudnn-8.0-linux-x64-v5.1.tgz -C /usr/local/cuda-8.0 --strip-components=1

RUN tar zxf /build_deps/jdk-8u102-linux-x64.tar.gz -C /opt --no-same-owner && \
    echo 'export JAVA_HOME=/opt/jdk1.8.0_102' > /etc/profile.d/java.sh && \
    echo 'export PATH=$PATH:/opt/jdk1.8.0_102/bin' >> /etc/profile.d/java.sh

RUN export JAVA_HOME=/opt/jdk1.8.0_102 && \
    /build_deps/bazel-0.3.1-installer-linux-x86_64.sh --prefix=/opt/bazel-0.3.1 && \
    echo 'export PATH=$PATH:/opt/bazel-0.3.1/bin' > /etc/profile.d/bazel.sh

RUN rm -rf /build_deps

RUN useradd -m tensorflow && \
    passwd -d tensorflow

USER tensorflow

COPY 0.11/build.sh /home/tensorflow

CMD ["/bin/bash"]
