#!/bin/bash

check_disk() {

    usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    echo "Current Disk Usage: ${usage}%"

    if [ "$usage" -gt 80 ]; then
        echo "WARNING: Disk usage is high!"
        return 1
    fi

    echo "Disk usage is normal."
    return 0
}

check_disk

echo
echo "Function Exit Status: $?"
