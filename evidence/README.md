# Evidence Index

The screenshots in this directory are extracted from the implementation report and renamed with **context-based filenames** so their purpose is immediately clear when viewed on GitHub.

| Figure | Context-based filename | Evidence |
|---:|---|---|
| 1 | `01-vps-service-host-specification.png` | SSDNodes VPS service and host specification |
| 2 | `02-ssdnodes-proxmox-private-network-vm-architecture.png` | SSDNodes, Proxmox, private-network, and VM deployment architecture |
| 3 | `03-proxmox-vmbr1-nat-dnat-topology.png` | Proxmox VE hypervisor, vmbr1 private network, NAT, and DNAT topology |
| 4 | `04-postfix-configuration-prompt.png` | Postfix configuration prompt during Proxmox VE installation |
| 5 | `05-proxmox-ve-login-interface.png` | Proxmox VE 9.2.4 login interface |
| 6 | `06-proxmox-datacenter-vm-summary.png` | Proxmox datacenter summary showing VM 100, VM 101, and VM 102 |
| 7 | `07-wazuh-server-vm-resource-summary.png` | Proxmox resource summary for Wazuh server VM 100 |
| 8 | `08-proxmox-network-enp3s0-vmbr1.jpeg` | Proxmox network configuration showing enp3s0 and vmbr1 |
| 9 | `09-ipv4-forwarding-verification.jpeg` | Verification of IPv4 forwarding enabled |
| 10 | `10-iptables-nat-dnat-rules.png` | Verification of active iptables NAT and DNAT rules |
| 11 | `11-wazuh-component-data-flow.png` | Wazuh component architecture and security-event data flow |
| 12 | `12-wazuh-manager-rule-processing-pipeline.png` | Wazuh manager rule-processing pipeline from raw log to alert JSON |
| 13 | `13-wazuh-overview-dashboard.jpeg` | Wazuh overview dashboard and principal security capability areas |
| 14 | `14-wazuh-dashboard-authentication-8443.png` | Wazuh dashboard authentication through external port 8443 |
| 15 | `15-wazuh-agent-001-active.jpeg` | Active Wazuh Agent 001 in the endpoint summary |
| 16 | `16-custom-local-rules-xml.png` | Custom SSH password-spraying and sudo privilege-escalation rules in `local_rules.xml` |
| 17 | `17-test-account-creation-alice-bob-charlie.png` | Creation of the alice, bob, and charlie test accounts on the monitored endpoint |
| 18 | `18-test-account-verification-getent-passwd.png` | Verification of test accounts with `getent passwd` |
| 19 | `19-users-txt-creation.png` | Opening `users.txt` for creation on ubuntu-attacker |
| 20 | `20-password-spraying-usernames.png` | Entering the password-spraying usernames in `users.txt` |
| 21 | `21-users-txt-verification.png` | Verification of `users.txt` on ubuntu-attacker |
| 22 | `22-hydra-ssh-password-spraying-test.png` | Hydra SSH password-spraying execution from ubuntu-attacker |
| 23 | `23-wazuh-level-12-password-spraying-alert.png` | Wazuh Level 12 alert for SSH password spraying |
| 24 | `24-failed-sudo-authentication-attempts.png` | Three failed sudo authentication attempts on ubuntu-agent |
| 25 | `25-wazuh-level-14-sudo-privilege-escalation-alert.png` | Wazuh Level 14 alert for repeated sudo privilege-escalation attempts |

## Publishing note

Before publishing the repository publicly, verify that every screenshot remains free of credentials, private keys, and unredacted public addresses.
