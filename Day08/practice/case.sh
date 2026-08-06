#!/bin/bash

echo "===== ENVIRONMENT SELECTOR ====="

read -p "Enter environment (dev/test/prod): " env

case $env in

    dev)
        echo "Development Environment"
        ;;

    test)
        echo "Testing Environment"
        ;;

    prod)
        echo "Production Environment"
        ;;

    *)
        echo "Invalid Environment"
        ;;
esac
