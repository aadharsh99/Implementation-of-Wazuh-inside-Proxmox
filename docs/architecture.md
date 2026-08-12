# Architecture and Data Flow

## Logical layers

1. **VPS hosting layer** — persistent compute, memory, storage and public network access.
2. **Debian / Proxmox layer** — Debian 13 host operating system and Proxmox VE virtualization.
3. **Private network layer** — `vmbr1` using `10.10.10.0/24`, with `10.10.10.1/24` as the guest gateway.
4. **Security-monitoring layer** — Wazuh server, monitored endpoint and controlled test source.

## Virtual machines

| VM | Role | Address | Allocation | Services |
|---|---|---|---|---|
| 100 | Wazuh server | `10.10.10.10` | 4 vCPU, ~9 GB RAM, 80 GB | Manager, Indexer, Dashboard, Filebeat, API |
| 101 | Monitored endpoint | `10.10.10.11` | 2 vCPU, 4 GB RAM, 20 GB | Wazuh Agent, SSH, journald/syslog, sudo |
| 102 | Test/attacker | `10.10.10.12` | 2 vCPU, 4 GB RAM, 10 GB | Hydra, SSH client, test files |

## Security boundary

The guests use private RFC 1918 addresses and do not receive direct public addresses. Outbound traffic is source-translated through the Proxmox host. Inbound administration is restricted to explicit DNAT mappings. Wazuh internal service ports remain private.

## Wazuh event path

```text
Ubuntu Agent
    |
    | 1514/TCP event forwarding
    v
Wazuh Manager
    |
    | decode -> built-in rules -> custom correlation -> alert JSON
    v
Filebeat
    |
    | 9200/TCP HTTPS
    v
Wazuh Indexer
    |
    v
Wazuh Dashboard
```

The dashboard/API path uses HTTPS and the implementation relies on TLS certificates and coordinated credentials across the relevant Wazuh components.
