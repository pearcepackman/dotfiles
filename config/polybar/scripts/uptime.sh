#!/bin/bash
uptime=$(uptime -p | sed 's/up //')
echo "Uptime: $uptime"
