#!/bin/bash

read -p "Enter CPU usage (%): " cpu

if [ "$cpu" -ge 90 ]; then

    echo "🔴 CRITICAL"

elif [ "$cpu" -ge 70 ]; then

    echo "🟡 WARNING"

else

    echo "🟢 HEALTHY"

fi
