## How to use

```sh
docker run --device=/dev/net/tun \
    --cap-add=NET_ADMIN \
    -v "path/to/config.ovpn:/app/ovpn.d/config.ovpn" \
    --dns=10.8.0.1 --dns=119.29.29.29 \
    -p 7890:7890 \
    ghcr.io/hurui/docker-openvpn-proxy
```
