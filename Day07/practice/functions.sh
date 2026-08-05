#!/bin/bash

check_memory() {
    echo "===== MEMORY USAGE ====="
    free -h
    echo
}

check_disk() {
    echo "===== DISK USAGE ====="
    df -h
    echo
}

check_uptime() {
    echo "===== SYSTEM UPTIME ====="
    uptime
    echo
}

echo "===== SYSTEM REPORT ====="

check_memory
check_disk
check_uptime
