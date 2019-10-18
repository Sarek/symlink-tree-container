FROM ubuntu:eoan

LABEL description "The container used for the CI builds of symlink-tree" \
      maintainer="Sarek <sarek@uliweb.de>"

RUN apt-get update && \
    apt-get install -y \
        cmake \
        git \
        libboost-dev \
        g++

RUN git clone https://github.com/catchorg/Catch2.git && \
    cd Catch2 && \
    cmake -Bbuild -H. -DBUILD_TESTING=OFF && \
    cmake --build build/ --target install && \
    cd .. && \
    rm -rf Catch2
