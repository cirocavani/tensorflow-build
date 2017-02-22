FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
        --no-install-recommends \
        build-essential \
        python3-dev \
        python3-wheel \
        python3-setuptools \
        python3-numpy \
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

COPY build_deps/jdk-8u121-linux-x64.tar.gz /build_deps/
COPY build_deps/bazel-0.4.4-installer-linux-x86_64.sh /build_deps/

RUN tar zxf /build_deps/jdk-8u121-linux-x64.tar.gz -C /opt --no-same-owner && \
    echo 'export JAVA_HOME=/opt/jdk1.8.0_121' > /etc/profile.d/java.sh && \
    echo 'export PATH=$PATH:/opt/jdk1.8.0_121/bin' >> /etc/profile.d/java.sh

RUN export JAVA_HOME=/opt/jdk1.8.0_121 && \
    /build_deps/bazel-0.4.4-installer-linux-x86_64.sh --prefix=/opt/bazel-0.4.4 && \
    echo 'export PATH=$PATH:/opt/bazel-0.4.4/bin' > /etc/profile.d/bazel.sh

RUN rm -rf /build_deps

RUN useradd -m tensorflow && \
    passwd -d tensorflow

USER tensorflow

COPY 1.0.0-cpu/build.sh /home/tensorflow

CMD ["/bin/bash"]
