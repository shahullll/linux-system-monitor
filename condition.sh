#!/bin/bash

DISK_USAGE=$(df -P / | awk 'NR==2 {gsub("%","",$5); print $5}')

echo "Current Disk Usage: $DISK_USAGE%"

if [ "$DISK_USAGE" -ge 80 ]; then
    echo "WARNING: Disk usage is high!"
else
    echo "Disk usage is normal."
fi
