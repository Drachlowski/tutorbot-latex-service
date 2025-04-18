FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    texlive-full \
    python3 \
    python3-pip \
    curl && \
    pip3 install --upgrade pip setuptools flask

COPY server.py .

CMD ["python3", "server.py"]