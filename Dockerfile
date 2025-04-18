FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    texlive-full \
    python3 \
    python3-pip \
    curl && \
    pip3 install --upgrade pip setuptools flask

WORKDIR /app
COPY server.py /app/server.py

ENV FLASK_APP=server.py
ENV FLASK_RUN_HOST=0.0.0.0

CMD ["python3", "server.py"]