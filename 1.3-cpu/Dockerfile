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

COPY build_deps/jdk-8u144-linux-x64.tar.gz /build_deps/
COPY build_deps/bazel-0.6.1-installer-linux-x86_64.sh /build_deps/
COPY build_deps/Miniconda3-4.3.27.1-Linux-x86_64.sh /build_deps/

RUN tar zxf /build_deps/jdk-8u144-linux-x64.tar.gz -C /opt --no-same-owner && \
    echo 'export JAVA_HOME=/opt/jdk1.8.0_144' > /etc/profile.d/java.sh && \
    echo 'export PATH=$PATH:/opt/jdk1.8.0_144/bin' >> /etc/profile.d/java.sh

RUN export JAVA_HOME=/opt/jdk1.8.0_144 && \
    /build_deps/bazel-0.6.1-installer-linux-x86_64.sh --prefix=/opt/bazel-0.6.1 && \
    echo 'export PATH=$PATH:/opt/bazel-0.6.1/bin' > /etc/profile.d/bazel.sh

RUN bash /build_deps/Miniconda3-4.3.27.1-Linux-x86_64.sh -b -f -p /opt/conda && \
    echo 'export PATH=$PATH:/opt/conda/bin' > /etc/profile.d/conda.sh && \
    /opt/conda/bin/conda install -y numpy

RUN rm -rf /build_deps

RUN useradd -m tensorflow && \
    passwd -d tensorflow

USER tensorflow

COPY 1.3-cpu/build.sh /home/tensorflow

CMD ["/bin/bash"]
