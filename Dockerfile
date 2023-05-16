FROM alpine:3.15

ENV CLASH_VERSION="v1.10.0"

WORKDIR /tmp

RUN apk add --no-cache ca-certificates tzdata openvpn && \
    wget -O Country.mmdb https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb && \
    wget -O clash-linux-amd64-$CLASH_VERSION.gz https://github.com/Dreamacro/clash/releases/download/v1.10.0/clash-linux-amd64-$CLASH_VERSION.gz && \
    gzip -d clash-linux-amd64-$CLASH_VERSION.gz && \
    mkdir -p /app && \
    mv clash-linux-amd64-$CLASH_VERSION /app/clash && \
    chmod +x /app/clash

COPY config.yaml /app/clash.d/
COPY start.sh /app/start.sh

CMD [ "/app/start.sh" ]
