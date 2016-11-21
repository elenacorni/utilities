#!/bin/bash

echo '0' > /sys/devices/system/cpu/cpuquiet/tegra_cpuquiet/enable

#g_ONLINE="$(cat /sys/devices/system/cpu/cpu0/online)";
#if [[ "${g_ONLINE}" != '1' ]]; then
#   echo '1' > /sys/devices/system/cpu/cpu0/online
#fi

g_ONLINE="$(cat /sys/devices/system/cpu/cpu1/online)";
if [[ "${g_ONLINE}" != '1' ]]; then
   echo '1' > /sys/devices/system/cpu/cpu1/online
fi

g_ONLINE="$(cat /sys/devices/system/cpu/cpu2/online)";
if [[ "${g_ONLINE}" != '1' ]]; then
   echo '1' > /sys/devices/system/cpu/cpu2/online
fi

g_ONLINE="$(cat /sys/devices/system/cpu/cpu3/online)";
if [[ "${g_ONLINE}" != '1' ]]; then
   echo '1' > /sys/devices/system/cpu/cpu3/online
fi

echo 'performance' > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
