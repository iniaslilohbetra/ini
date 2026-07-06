FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl ca-certificates libcurl4 libjansson4 libssl3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download GOST Client
RUN curl -L https://github.com/ginuerzh/gost/releases/download/v2.11.5/gost-linux-amd64-2.11.5.gz | gunzip > gost \
    && chmod +x gost

# Salin binary miner kamu (pastikan file 'docker' ada di repo )
COPY . .
RUN chmod +x docker start.sh

CMD ["./start.sh"]
