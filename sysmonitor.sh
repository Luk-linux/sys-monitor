#!/bin/bash

while true; do
    echo "----- System Monitor -----"
    
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *$[0-9.]*$%* id.*/\1/" | awk '{print 100 - $1 "%"}'
    
    echo "Memory Usage:"
    free -h | awk '/^Mem:/ {print $3 "/" $2 " (" $3/$2*100 "%)"}'
    
    echo "Disk Usage:"
    df -h | awk '$NF=="/"{print $3 "/" $2 " (" $3/$2*100 "%)"}'
    
    echo "-------------------------"
    sleep 5
done

