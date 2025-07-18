#!/bin/bash
used=$(free | awk '/Mem:/ {printf("%.0f", $3/$2 * 100)}')
echo "RAM ${used}%"
