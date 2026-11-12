#!/bin/bash

show_system_info() {
    echo "SYSTEM INFORMATION"
    echo "------------------"
    echo "Computer: $(hostname)"
    echo "Username: $(whoami)"
    echo "Kernel: $(uname -r)"
}

show_system_info
