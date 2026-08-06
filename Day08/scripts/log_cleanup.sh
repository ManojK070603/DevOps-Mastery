#!/bin/bash

LOG_DIR="$HOME/DevOps-Mastery/Day08/logs"

echo "===== LOG CLEANUP ====="

if [ ! -d "$LOG_DIR" ]; then
    echo "Log directory not found!"
    exit 1
fi

find "$LOG_DIR" -name "*.log" -mtime +7 -delete

echo "Old log files deleted successfully."
