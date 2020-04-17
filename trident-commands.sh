#!/bin/bash
# Run basic commands on Trident and output to terminal or file.
# Patrick Shelton 4-17-2020
# Run command: ssh -J cloudvpn root@[ip of trident] < trident-commands.sh
# Or run command: ssh -J cloudvpn root@[ip of trident] < trident-commands.sh > output.file
# Example: ssh -J cloudvpn root@10.102.24.235 < trident-commands.sh
#          ssh -J cloudvpn root@10.102.24.235 < trident-commands.sh > trident-output.txt

echo "COMMAND /opt/ks/whatami.bash"
/opt/ks/whatami.bash
echo "COMMAND uptime"
uptime
echo "COMMAND starry_version"
starry_version
echo "COMMAND siv_version"
cat /data/siv_version | grep "__version__" | cut -d'"' -f 2 | cut -d'"' -f 1
echo "COMMAND ratty cpld get software_version"
ratty cpld get software_version
echo "COMMAND ratty ehf get lo_lock_chain_status"
ratty ehf get lo_lock_chain_status
echo "COMMAND strings /dev/mmcblk0boot0 | grep 'U-Boot SPL'"
strings /dev/mmcblk0boot0 | grep 'U-Boot SPL'
echo "COMMAND sysadminctl get wireless.* | grep 4addr"
sysadminctl get wireless.* | grep 4addr

echo "COMMAND siv_get_mcs"
python /data/debug/prototypes/histogram.py --get_mcs
echo "COMMAND siv_get_rx_power_full"
python /data/debug/prototypes/proto_cal.py --get_rx_cal_power --cal_file /data/eeprom/ehf.yaml "$@"
echo "COMMAND siv_get_rx_gain"
python /data/debug/prototypes/proto_cal.py --get_rx_gain --cal_file /data/eeprom/ehf.yaml

exit 0
