#!/bin/bash

CURRENT_USER=$(whoami)
HOST=$(hostname)
CURRENT_DATE=$(date)
UPTIME=$(uptime -p)
IP=$(hostname -I)

echo "===== SYSTEM INFORMATION ====="
echo "User: $CURRENT_USER"
echo "Hostname: $HOST"
echo "Date: $CURRENT_DATE"
echo "Uptime: $UPTIME"
echo "IP Address: $IP"
