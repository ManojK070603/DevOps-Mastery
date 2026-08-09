#!/bin/bash

# ==========================================
#       LINUX DISK MONITORING TOOL
# ==========================================

REPORT_DIR="$HOME/DevOps-Mastery/Day10/reports"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/disk_report_$TIMESTAMP.log"

mkdir -p "$REPORT_DIR"

echo "========================================" | tee "$REPORT_FILE"
echo "       DISK MONITORING REPORT" | tee -a "$REPORT_FILE"
echo "========================================" | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

echo "Date     : $(date)" | tee -a "$REPORT_FILE"
echo "Hostname : $(hostname)" | tee -a "$REPORT_FILE"
echo "User     : $(whoami)" | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

# ==========================================
# FILESYSTEM USAGE
# ==========================================

echo "========== FILESYSTEM USAGE ==========" | tee -a "$REPORT_FILE"

df -hT | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

# ==========================================
# ROOT DISK STATUS
# ==========================================

usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Root Filesystem Usage: ${usage}%" | tee -a "$REPORT_FILE"

if [ "$usage" -ge 90 ]; then
    STATUS="CRITICAL"
elif [ "$usage" -ge 70 ]; then
    STATUS="WARNING"
else
    STATUS="HEALTHY"
fi

echo "Root Filesystem Status: $STATUS" | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

# ==========================================
# INODE USAGE
# ==========================================

echo "========== INODE USAGE ==========" | tee -a "$REPORT_FILE"

df -ih | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

# ==========================================
# TOP DIRECTORIES
# ==========================================

echo "========== TOP DIRECTORIES ==========" | tee -a "$REPORT_FILE"

du -h --max-depth=1 "$HOME" 2>/dev/null | sort -h | tail -10 | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

# ==========================================
# LARGE FILES
# ==========================================

echo "========== LARGE FILES (>100MB) ==========" | tee -a "$REPORT_FILE"

find "$HOME" -type f -size +100M -exec ls -lh {} \; 2>/dev/null | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

# ==========================================
# FILESYSTEM TYPE
# ==========================================

echo "========== FILESYSTEM TYPES ==========" | tee -a "$REPORT_FILE"

df -Th | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

# ==========================================
# SWAP STATUS
# ==========================================

echo "========== SWAP STATUS ==========" | tee -a "$REPORT_FILE"

free -h | grep -i swap | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

swapon --show | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

# ==========================================
# CLEANUP SUGGESTIONS
# ==========================================

echo "========== SUGGESTED ACTIONS ==========" | tee -a "$REPORT_FILE"

if [ "$usage" -ge 90 ]; then

    echo "CRITICAL: Disk usage is very high." | tee -a "$REPORT_FILE"
    echo "1. Check /var/log for large logs." | tee -a "$REPORT_FILE"
    echo "2. Find large files." | tee -a "$REPORT_FILE"
    echo "3. Check old backups." | tee -a "$REPORT_FILE"
    echo "4. Check temporary files." | tee -a "$REPORT_FILE"

elif [ "$usage" -ge 70 ]; then

    echo "WARNING: Disk usage is getting high." | tee -a "$REPORT_FILE"
    echo "Consider investigating large files and logs." | tee -a "$REPORT_FILE"

else

    echo "Disk usage is currently healthy." | tee -a "$REPORT_FILE"

fi

echo | tee -a "$REPORT_FILE"

# ==========================================
# FINAL STATUS
# ==========================================

echo "========== OVERALL STATUS ==========" | tee -a "$REPORT_FILE"

echo "$STATUS" | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

echo "========================================" | tee -a "$REPORT_FILE"
echo "       REPORT COMPLETED" | tee -a "$REPORT_FILE"
echo "========================================" | tee -a "$REPORT_FILE"

echo
echo "Report saved to:"
echo "$REPORT_FILE"
