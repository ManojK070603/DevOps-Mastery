#!/bin/bash

SOURCE="$HOME/DevOps-Mastery/Day08"
DEST="$HOME/DevOps-Mastery/Day08/backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$DEST"

BACKUP_FILE="$DEST/backup_$DATE.tar.gz"

echo "===== AUTO BACKUP ====="
echo "Source: $SOURCE"
echo "Destination: $DEST"

tar -czf "$BACKUP_FILE" "$SOURCE"

if [ $? -eq 0 ]; then
    echo "✅ Backup created successfully!"
    echo "Backup File: $BACKUP_FILE"
else
    echo "❌ Backup failed!"
fi
