
#!/bin/bash
# System Information Variables

CURRENT_USER=$(whoami)
COMPUTER_NAME=$(hostname)
REPORT_DATE=$(date +"%d-%m-%Y")
REPORT_TIME=$(date +"%H:%M:%S")
# Linux System Health Monitor

echo "=================================="
echo "     LINUX SYSTEM HEALTH MONITOR"
echo "=================================="

echo ""
echo "System Information:"
hostname
uname -r

echo ""
echo "System Uptime:"
uptime

echo ""
echo "CPU Usage:"
top -bn1 | grep "%Cpu(s)" | awk '{print 100 - $8 "%"}'


echo ""
echo "RAM Usage:"

echo "Total RAM:"
free -h | awk '/^Mem:/ {print $2}'

echo "Used RAM:"
free -h | awk '/^Mem:/ {print $3}'

echo "Available RAM:"
free -h | awk '/^Mem:/ {print $7}'

echo ""
echo "Memory Usage:"
free -h

echo ""
echo "Disk Usage:"
df -h

echo ""
echo "=================================="
echo "LOGGED-IN USERS"
echo "=================================="

who


echo ""
echo "=================================="
echo "TOP 5 MEMORY-CONSUMING PROCESSES"
echo "=================================="

ps aux --sort=-%mem | head -n 6


echo ""
echo "=================================="
echo "       MONITORING COMPLETED"
echo "=================================="
