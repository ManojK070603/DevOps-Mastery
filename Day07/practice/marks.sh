#!/bin/bash

read -p "Enter your marks: " marks

if [ "$marks" -ge 35 ]; then
    echo
    echo "✅ You are Pass."
else
    echo
    echo "❌ You are not Fail."
fi
