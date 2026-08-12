# Troubleshooting Notes

The implementation encountered several infrastructure and SIEM-specific issues.

| Issue | Diagnostic approach | Resolution / lesson |
|---|---|---|
| Nested virtualization lag/disconnections | Reviewed host resource pressure and architecture | Moved to dedicated VPS and lightweight guests |
| Proxmox node/services offline | Checked hostname, `/etc/hosts`, repository and `pve-cluster`/`pvestatd` | Corrected local node mapping and restarted affected services |
| Guest Internet/DNS failure | Checked bridge, gateway, forwarding, FORWARD, MASQUERADE, routes and resolver | Tested connectivity layer-by-layer |
| DNAT timeout | Compared PREROUTING, FORWARD, POSTROUTING and destination service state | Verified translation, forwarding, route and listening service |
| NAT lost after reboot | Checked persistence | Used persistent IPv4 forwarding and saved iptables rules |
| Wazuh dashboard not ready | Checked Manager, Indexer, Filebeat, Dashboard and resource usage | Addressed initialization/resource pressure and verified dependencies |
| Indexer HTTP 401 | Tested TLS reachability and credentials | Aligned internal users, Filebeat keystore and dashboard credentials |
| API offline | Checked port 55000, API state, credentials and configuration | Removed unsupported API option and revalidated |
| Custom rule restart failure | Ran `wazuh-analysisd -t` and `wazuh-logtest`; checked XML | Corrected rule structure/IDs before restart |
| Hydra `users.txt` missing | Checked file location on the executing VM | Recreated the file on the attacker/test VM |

## Structured method

1. Define the exact symptom and affected component.
2. Check resources, time, disk space, DNS, routes and listening ports.
3. Inspect systemd status and the most relevant journal/log.
4. Test the nearest dependency directly.
5. Change one variable at a time and preserve backups before credential/certificate changes.
6. Retest the complete data path after the component issue is resolved.
