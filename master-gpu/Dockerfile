FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        --no-install-recommends \
        libcuda1-375 \
        build-essential \
        python3 \
        swig \
        zlib1g-dev \
        unzip \
        file \
        git \
        ca-certificates \
        rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    cd /usr/bin && \
    ln -s python3.5 python

COPY build_deps/ /build_deps/

RUN /build_deps/cuda_8.0.61_375.26_linux-run --silent --toolkit --override && \
    tar zxf /build_deps/cudnn-8.0-linux-x64-v6.0.tgz -C /usr/local/cuda-8.0 --strip-components=1

RUN tar zxf /build_deps/jdk-8u144-linux-x64.tar.gz -C /opt --no-same-owner && \
    echo 'export JAVA_HOME=/opt/jdk1.8.0_144' > /etc/profile.d/java.sh && \
    echo 'export PATH=$PATH:/opt/jdk1.8.0_144/bin' >> /etc/profile.d/java.sh

RUN export JAVA_HOME=/opt/jdk1.8.0_144 && \
    /build_deps/bazel-0.5.3-installer-linux-x86_64.sh --prefix=/opt/bazel-0.5.3 && \
    echo 'export PATH=$PATH:/opt/bazel-0.5.3/bin' > /etc/profile.d/bazel.sh

RUN bash /build_deps/Miniconda3-4.3.21-Linux-x86_64.sh -b -f -p /opt/conda && \
    /opt/conda/bin/conda install -y numpy

RUN rm -rf /build_deps

RUN useradd -m tensorflow && \
    passwd -d tensorflow

USER tensorflow

COPY master-gpu/build.sh /home/tensorflow

CMD ["/bin/bash"]
