# Custom Detection Specifications

The implementation report records the following custom Wazuh detections in `local_rules.xml`.

## 100100 — Possible SSH Password Spraying

- Base rule: `5760`
- Frequency: `3`
- Timeframe: `120` seconds
- Same source IP correlation
- Level: `12`
- MITRE ATT&CK: `T1110.003`

The report notes that production tuning should additionally consider different usernames when the decoded fields support that correlation.

## 100140 — Repeated Failed Sudo Privilege Escalation

- Base rule: `5404`
- Frequency: `2`
- Timeframe: `300` seconds
- Same source user correlation
- Level: `14`
- MITRE ATT&CK: `T1548.003`

## Safe validation sequence

```bash
sudo /var/ossec/bin/wazuh-analysisd -t
sudo /var/ossec/bin/wazuh-logtest
sudo systemctl restart wazuh-manager
sudo journalctl -u wazuh-manager -n 100 --no-pager
```

Validate custom XML before restarting the manager. Duplicate IDs, malformed XML, unsupported tags and incompatible correlation conditions can interrupt the analysis service.
