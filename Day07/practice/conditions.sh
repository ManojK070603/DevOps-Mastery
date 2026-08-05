#!/bin/bash

read -p "Enter your age: " age

if [ "$age" -ge 18 ]; then
    echo
    echo "✅ You are eligible to vote."
else
    echo
    echo "❌ You are not eligible to vote."
fi
