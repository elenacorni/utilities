#!/bin/bash
echo " "
echo "## A. Freq. CPU:"
cpufreq-info | grep current | grep -v policycpufreq-info | grep current | grep -v policy
echo " "
echo "## B. CPU online:"
cat /sys/devices/system/cpu/online
echo " "
echo "## C. Freq. GPU:"
cat /sys/kernel/debug/clock/gbus/rate
echo " "
