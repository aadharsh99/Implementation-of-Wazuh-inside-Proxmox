# Detection Engineering

The project used a repeatable detection-engineering workflow:

1. Generate or locate a representative event.
2. Confirm the decoder and relevant built-in rule.
3. Define suspicious behaviour using frequency, timeframe, source, user, command or other fields.
4. Assign a custom rule ID, severity, description, groups and MITRE ATT&CK mapping.
5. Validate XML and rule behaviour before restarting the manager.
6. Execute a controlled test and review alert fields, timing and false-positive implications.

## Rule 100100 — SSH password spraying

| Property | Value |
|---|---|
| Base rule | `5760` |
| Frequency | 3 |
| Timeframe | 120 seconds |
| Correlation | Same source IP |
| Severity | Level 12 |
| MITRE | T1110.003 |

The lab validation used Hydra against the isolated monitored endpoint with a deliberately incorrect password and a small test-user list. The resulting Wazuh alert contained the monitored agent, source IP, changing destination usernames, authentication-failure group, rule ID, severity and MITRE mapping.

## Rule 100140 — repeated failed sudo elevation

| Property | Value |
|---|---|
| Base rule | `5404` |
| Frequency | 2 |
| Timeframe | 300 seconds |
| Correlation | Same source user |
| Severity | Level 14 |
| MITRE | T1548.003 |

The validation used `sudo su` and three deliberately incorrect password entries. No root access was obtained and the system was not modified. The resulting alert identified the monitored endpoint, user context, attempted destination user, command `/usr/bin/su`, rule metadata and MITRE mapping.

## Analyst interpretation

High severity indicates priority, not confirmed compromise. The analyst should review the user, command, host, source session and preceding authentication activity before declaring an incident. Production tuning should test benign mistakes, slow attempts, multiple sources and missing fields to control false positives and missed detections.
