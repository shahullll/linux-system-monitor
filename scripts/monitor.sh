
#!/bin/bash
# Check required commands

for command in top free df awk ps who; do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "ERROR: Required command '$command' is missing."
        exit 1
    fi
done

echo "All required commands are available."
# ==========================================
# LINUX SYSTEM HEALTH MONITOR
# ==========================================

# System Information Variables
CURRENT_USER=$(whoami)
COMPUTER_NAME=$(hostname)
REPORT_DATE=$(date +"%d-%m-%Y")
REPORT_TIME=$(date +"%H:%M:%S")

# Function 1: System Information
show_system_info() {
    echo "=================================="
    echo "     LINUX SYSTEM HEALTH MONITOR"
    echo "=================================="

    echo "Report Date: $REPORT_DATE"
    echo "Report Time: $REPORT_TIME"
    echo "Computer Name: $COMPUTER_NAME"
    echo "Current User: $CURRENT_USER"
    echo "Kernel Version: $(uname -r)"

    echo ""
    echo "System Uptime:"
    uptime
}

# Function 2: CPU Usage
show_cpu_usage() {
    echo ""
    echo "=================================="
    echo "CPU USAGE"
    echo "=================================="

    top -bn1 | grep "%Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'
}

# Function 3: Memory Usage
show_memory_usage() {
    echo ""
    echo "=================================="
    echo "RAM USAGE"
    echo "=================================="

    free -h | awk '/^Mem:/ {
        print "Total RAM: " $2
        print "Used RAM: " $3
        print "Available RAM: " $7
    }'
}

# Function 4: Disk Usage
show_disk_usage() {
    echo ""
    echo "=================================="
    echo "DISK USAGE"
    echo "=================================="

    DISK_USAGE=$(df -P / | awk 'NR==2 {
        gsub("%","",$5)
        print $5
    }')

    df -h /

    echo ""

    if [ "$DISK_USAGE" -ge 80 ]; then
        echo "WARNING: Disk usage is HIGH!"
    else
        echo "Disk usage is NORMAL."
    fi
}

# Function 5: Logged-in Users
show_logged_users() {
    echo ""
    echo "=================================="
    echo "LOGGED-IN USERS"
    echo "=================================="

    who
}

# Function 6: Top Processes
show_processes() {
    echo ""
    echo "=================================="
    echo "TOP 5 MEMORY-CONSUMING PROCESSES"
    echo "=================================="

    ps aux --sort=-%mem | head -n 6
}

# ==========================================
# MAIN PROGRAM
# ==========================================

show_system_info
show_cpu_usage
show_memory_usage
show_disk_usage
show_logged_users
show_processes

echo ""
echo "=================================="
echo "       MONITORING COMPLETED"
echo "=================================="

