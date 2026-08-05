#!/bin/bash

echo "=================================="
echo "      BACKUP AUTOMATION"
echo "=================================="

SOURCE_DIR=$1

# Check if user provided an argument
if [ -z "$SOURCE_DIR" ]; then
    echo "❌ Error: No directory provided."
    echo "Usage: ./scripts/backup.sh <directory>"
    exit 1
fi

# Check if directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "❌ Error: Directory does not exist."
    exit 1
fi

echo "✅ Directory found: $SOURCE_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

echo "Timestamp: $TIMESTAMP"

BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

echo "Backup File: $BACKUP_NAME"

echo
echo "Creating backup..."

tar -czf backups/$BACKUP_NAME "$SOURCE_DIR"

echo

if [ $? -eq 0 ]; then
    echo "======================================"
    echo "      BACKUP COMPLETED SUCCESSFULLY"
    echo "======================================"
    echo "Source Directory : $SOURCE_DIR"
    echo "Backup File      : $BACKUP_NAME"
    echo "Location         : backups/$BACKUP_NAME"
    echo "Date             : $(date)"
    echo "======================================"
else
    echo "======================================"
    echo "❌ BACKUP FAILED!"
    echo "Please check the directory and try again."
    echo "======================================"
fi
