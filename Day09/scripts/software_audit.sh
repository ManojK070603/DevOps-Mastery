#!/bin/bash

# ==========================================
#       SOFTWARE AUDIT TOOL
# ==========================================

REPORT_DIR="$HOME/DevOps-Mastery/Day09/reports"
REPORT_FILE="$REPORT_DIR/audit_report.txt"

mkdir -p "$REPORT_DIR"

echo "==========================================" | tee "$REPORT_FILE"
echo "          SOFTWARE AUDIT REPORT" | tee -a "$REPORT_FILE"
echo "==========================================" | tee -a "$REPORT_FILE"
echo "Date     : $(date)" | tee -a "$REPORT_FILE"
echo "Hostname : $(hostname)" | tee -a "$REPORT_FILE"
echo | tee -a "$REPORT_FILE"

check_software() {

    NAME="$1"
    COMMAND="$2"

    if command -v "$COMMAND" >/dev/null 2>&1; then
        VERSION=$("$COMMAND" --version 2>&1 | head -n 1)

        echo "$NAME : INSTALLED" | tee -a "$REPORT_FILE"
        echo "  Version: $VERSION" | tee -a "$REPORT_FILE"
    else
        echo "$NAME : NOT INSTALLED" | tee -a "$REPORT_FILE"
    fi

    echo | tee -a "$REPORT_FILE"
}

check_software "Git" "git"
check_software "Java" "java"
check_software "Maven" "mvn"
check_software "Docker" "docker"
check_software "Curl" "curl"
check_software "Wget" "wget"
check_software "Nginx" "nginx"
check_software "PostgreSQL" "psql"

echo "==========================================" | tee -a "$REPORT_FILE"
echo "           AUDIT COMPLETED" | tee -a "$REPORT_FILE"
echo "==========================================" | tee -a "$REPORT_FILE"

echo
echo "Audit report saved to:"
echo "$REPORT_FILE"
