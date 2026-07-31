#!/bin/bash

echo "================================"
echo "      NETWORK HEALTH REPORT"
echo "================================"

echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "User: $(whoami)"

echo
echo "===== IP ADDRESS ====="
echo "IP: $(hostname -I)"

echo
echo "===== INTERNET CONNECTIVITY ====="

if ping -c 1 8.8.8.8 > /dev/null 2>&1
then
    echo "Internet Connectivity: OK"
else
    echo "Internet Connectivity: FAILED"
fi
echo
echo "===== DNS CHECK ====="

if nslookup google.com > /dev/null 2>&1
then
    echo "DNS Resolution: OK"
else
    echo "DNS Resolution: FAILED"
fi
echo
echo "===== HTTP CHECK ====="

if curl -Is https://google.com > /dev/null 2>&1
then
    echo "HTTP Connectivity: OK"
else
    echo "HTTP Connectivity: FAILED"
fi
echo
echo "===== MEMORY USAGE ====="
free -h

echo
echo "===== DISK USAGE ====="
df -h
echo
echo "===== LISTENING PORTS ====="
ss -tuln
