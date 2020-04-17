#!/bin/bash
# Run basic commands on HMF and output to terminal or file
# Patrick Shelton 4-17-2020
# Run command: ssh -J cloudvpn root@[ip of HMF] < helios-commands.sh
# Or run command: ssh -J cloudvpn root@[ip of HMF] < helios-commands.sh > output.file
# Example: ssh -J cloudvpn root@10.100.41.159 < helios-commands.sh
#          ssh -J cloudvpn root@10.100.41.159 < helios-commands.sh > helios-output.txt

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
echo "COMMAND sysadminctl get wireless.radio0.enabled"
sysadminctl get wireless.radio0.enabled
echo "COMMAND sysadminctl get wireless.radio0.virtual_interface0.ssid"
sysadminctl get wireless.radio0.virtual_interface0.ssid
echo "COMMAND sysadminctl get wireless.radio0.radio_mode"
sysadminctl get wireless.radio0.radio_mode
echo "COMMAND siv_health"
python /data/debug/prototypes/rf_stats.py

exit 0
