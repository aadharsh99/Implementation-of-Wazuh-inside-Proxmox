# Validation Commands and Test Workflow

## Rule validation

```bash
sudo /var/ossec/bin/wazuh-analysisd -t
sudo /var/ossec/bin/wazuh-logtest
```

## SSH password-spraying validation

The lab used Hydra only against the isolated test endpoint, with a deliberately incorrect password and a small test-user list. The goal was to generate controlled SSH authentication failures and validate rule `100100` / Level 12 / T1110.003.

Do not adapt the test to unrelated or public systems.

## Failed sudo validation

On the monitored endpoint, the documented scenario used:

```bash
sudo su
```

The password was intentionally entered incorrectly three times. The scenario was designed to create a clear sudo failure record without obtaining root access or modifying the system. The expected custom detection was rule `100140` / Level 14 / T1548.003.
