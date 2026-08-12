# Proxmox IPv4 Forwarding, NAT and DNAT

The following commands reflect the implemented lab ruleset. Replace interface names and internal addresses when adapting the design to another environment.

```bash
sysctl -w net.ipv4.ip_forward=1

iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -o enp3s0 -j MASQUERADE
iptables -A FORWARD -i vmbr1 -o enp3s0 -j ACCEPT
iptables -A FORWARD -i enp3s0 -o vmbr1 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 2222 -j DNAT --to-destination 10.10.10.10:22
iptables -A FORWARD -i enp3s0 -o vmbr1 -p tcp -d 10.10.10.10 --dport 22 -j ACCEPT

iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 8443 -j DNAT --to-destination 10.10.10.10:443
iptables -A FORWARD -i enp3s0 -o vmbr1 -p tcp -d 10.10.10.10 --dport 443 -j ACCEPT

iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 2223 -j DNAT --to-destination 10.10.10.11:22
iptables -A FORWARD -i enp3s0 -o vmbr1 -p tcp -d 10.10.10.11 --dport 22 -j ACCEPT

iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 2224 -j DNAT --to-destination 10.10.10.12:22
iptables -A FORWARD -i enp3s0 -o vmbr1 -p tcp -d 10.10.10.12 --dport 22 -j ACCEPT
```

## Persistence

```bash
echo 'net.ipv4.ip_forward=1' > /etc/sysctl.d/99-proxmox-routing.conf
sysctl --system
apt install -y iptables-persistent
netfilter-persistent save
```

## Verification

```bash
iptables -t nat -L -n -v
iptables -L FORWARD -n -v
ip route
```

Only expose the forwarded services required by the lab. Test DNAT from an external network when validating the real inbound path.
