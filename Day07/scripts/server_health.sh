#!/bin/bash

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="reports/server_health_$TIMESTAMP.log"

echo "======================================="
echo "       SERVER HEALTH REPORT"
echo "======================================="

CURRENT_DATE=$(date)
HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)
IP_ADDRESS=$(hostname -I)

echo "Date        : $CURRENT_DATE"
echo "Hostname    : $HOSTNAME"
echo "Current User: $CURRENT_USER"
echo "IP Address  : $IP_ADDRESS"

echo
echo "========== MEMORY USAGE =========="
free -h

echo
echo "========== DISK USAGE =========="
df -h

echo
echo "========== SYSTEM UPTIME =========="
uptime -p

echo
echo "========== INTERNET CONNECTIVITY =========="

if ping -c 1 google.com > /dev/null 2>&1
then
    echo "Internet Status: CONNECTED"
else
    echo "Internet Status: NOT CONNECTED"
fi
echo
echo "========== TOP 5 CPU PROCESSES =========="

ps -eo pid,comm,%cpu --sort=-%cpu | head -6
echo
echo "========== TOP 5 MEMORY PROCESSES =========="

ps -eo pid,comm,%mem --sort=-%mem | head -6

echo
echo "========== LISTENING PORTS =========="

ss -tuln
