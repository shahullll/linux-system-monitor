#!/bin/bash

echo "Checking whether the file exists..."

if [ -f "README.md" ]; then
    echo "SUCCESS: README.md exists."
else
    echo "ERROR: README.md was not found."
fi
