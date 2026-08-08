#!/bin/bash

# ==========================================
#       SERVER BOOTSTRAP SCRIPT
# ==========================================

REPORT_DIR="$HOME/DevOps-Mastery/Day09/reports"
REPORT_FILE="$REPORT_DIR/bootstrap_report.txt"

mkdir -p "$REPORT_DIR"

echo "==========================================" | tee "$REPORT_FILE"
echo "       SERVER BOOTSTRAP REPORT" | tee -a "$REPORT_FILE"
echo "==========================================" | tee -a "$REPORT_FILE"
echo "Date     : $(date)" | tee -a "$REPORT_FILE"
echo "Hostname : $(hostname)" | tee -a "$REPORT_FILE"
echo "User     : $(whoami)" | tee -a "$REPORT_FILE"
echo | tee -a "$REPORT_FILE"

echo "===== UPDATING PACKAGE LIST =====" | tee -a "$REPORT_FILE"

if sudo apt update; then
    echo "APT update: SUCCESS" | tee -a "$REPORT_FILE"
else
    echo "APT update: FAILED" | tee -a "$REPORT_FILE"
    exit 1
fi

echo | tee -a "$REPORT_FILE"

echo "===== INSTALLING SOFTWARE =====" | tee -a "$REPORT_FILE"

PACKAGES=(
    git
    curl
    wget
    openjdk-21-jdk
    maven
)

if sudo apt install -y "${PACKAGES[@]}"; then
    echo "Software installation: SUCCESS" | tee -a "$REPORT_FILE"
else
    echo "Software installation: FAILED" | tee -a "$REPORT_FILE"
    exit 1
fi

echo | tee -a "$REPORT_FILE"

echo "===== SOFTWARE VERIFICATION =====" | tee -a "$REPORT_FILE"

echo "Git:" | tee -a "$REPORT_FILE"
git --version 2>&1 | tee -a "$REPORT_FILE"

echo "Java:" | tee -a "$REPORT_FILE"
java -version 2>&1 | tee -a "$REPORT_FILE"

echo "Maven:" | tee -a "$REPORT_FILE"
mvn -version 2>&1 | tee -a "$REPORT_FILE"

echo "Curl:" | tee -a "$REPORT_FILE"
curl --version | head -n 1 | tee -a "$REPORT_FILE"

echo "Wget:" | tee -a "$REPORT_FILE"
wget --version | head -n 1 | tee -a "$REPORT_FILE"

echo | tee -a "$REPORT_FILE"

echo "==========================================" | tee -a "$REPORT_FILE"
echo "       BOOTSTRAP COMPLETED SUCCESSFULLY" | tee -a "$REPORT_FILE"
echo "==========================================" | tee -a "$REPORT_FILE"

echo
echo "Report saved to:"
echo "$REPORT_FILE"
