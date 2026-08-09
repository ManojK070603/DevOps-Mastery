#!/bin/bash

SERVER="$1"

if [ -z "$SERVER" ]; then
    echo "Usage: $0 <server>"
    exit 1
fi

echo "========================================"
echo "       REMOTE SERVER HEALTH CHECK"
echo "========================================"
echo "Server: $SERVER"
echo

echo "========== UPTIME =========="
ssh "$SERVER" "uptime"

echo
echo "========== MEMORY =========="
ssh "$SERVER" "free -h"

echo
echo "========== DISK =========="
ssh "$SERVER" "df -h"

echo
echo "========== LISTENING PORTS =========="
ssh "$SERVER" "ss -tuln"

echo
echo "========== PROCESSES =========="
ssh "$SERVER" "ps -ef"

echo
echo "========================================"
echo "       HEALTH CHECK COMPLETED"
echo "========================================"
