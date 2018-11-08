ARG CUDA_VERSION=9.0
FROM nvidia/cuda:${CUDA_VERSION}-devel

RUN apt-get update \
      && apt-get install --no-install-recommends -y build-essential cmake \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir /cuda_memtest
COPY . /cuda_memtest
WORKDIR /cuda_memtest
RUN cmake . && make

CMD ["./cuda_memtest"]
