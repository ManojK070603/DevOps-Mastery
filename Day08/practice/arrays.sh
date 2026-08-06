#!/bin/bash

servers=("web01" "web02" "db01" "cache01")

echo "===== SERVER LIST ====="

echo "First Server: ${servers[0]}"
echo "Second Server: ${servers[1]}"
echo "All Servers: ${servers[@]}"
echo "Number of Servers: ${#servers[@]}"

echo
echo "Checking Servers..."

for server in "${servers[@]}"
do
    echo "Checking $server..."
done
