#!/bin/sh
trap "echo 'Stopping services...'" HUP INT QUIT TERM

mkdir -p /app/clash.d && mkdir -p /app/ovpn.d && mv /tmp/Country.mmdb /app/clash.d/Country.mmdb
/app/clash -d /app/clash.d &

# Find the first file with the filename suffix ovpn
config_file=$(find /app/ovpn.d -name "*.ovpn" 2> /dev/null | sort | shuf -n 1)
if [[ -z "$config_file" ]]; then
    >&2 echo "Fatal: The openvpn config file is not exist!"
    exit 1
fi
openvpn --config $config_file &

wait -n
