#!/bin/bash

REPORT_DIR="$HOME/DevOps-Mastery/Day08/reports"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/server_health_$TIMESTAMP.log"

mkdir -p "$REPORT_DIR"

{
echo "==========================================="
echo "      SERVER HEALTH REPORT"
echo "==========================================="
echo "Date        : $(date)"
echo "Hostname    : $(hostname)"
echo "Current User: $(whoami)"
echo "IP Address  : $(hostname -I)"
echo

echo "========== CPU USAGE =========="
top -bn1 | grep "Cpu(s)"

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
    echo "Internet Status : CONNECTED"
else
    echo "Internet Status : DISCONNECTED"
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

echo

echo "========== OVERALL HEALTH =========="

DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK" -ge 90 ]
then
    echo "Status : CRITICAL"
elif [ "$DISK" -ge 70 ]
then
    echo "Status : WARNING"
else
    echo "Status : HEALTHY"
fi

echo
echo "==========================================="
echo "Report saved successfully."
echo "==========================================="

} | tee "$REPORT_FILE"
