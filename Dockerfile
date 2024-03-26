# Base image with Python
FROM python:3.9.19-slim-bookworm

# Contact details 
MAINTAINER Georgie Samaha <sih.info@sydney.edu.au>

# Set the working directory inside the container
WORKDIR /app

# Set environmental variables 
ENV NAME plassembler
ENV VERSION 1.6.2

# Install system dependencies
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    git \
    wget \
    build-essential \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    && rm -rf /var/lib/apt/lists/* 

# Install plassembler v1.6.2
RUN git clone --branch v1.6.2 https://github.com/gbouras13/plassembler.git && \
  cd plassembler && \
  pip3 install -e .

# Install Unicycler v0.5.0
RUN git clone https://github.com/rrwick/Unicycler.git && \
  cd Unicycler && \
  python3 setup.py install

# Install FLye version 2.9.3
RUN git clone https://github.com/fenderglass/Flye && \
  cd Flye && \
  make


# Run Plassembler
CMD ["plassembler", "--help"]
