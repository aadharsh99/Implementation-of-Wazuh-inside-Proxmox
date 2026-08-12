# Proxmox Host Commands

## Host checks

```bash
apt update
apt install -y curl gnupg2
hostnamectl
getent hosts $(hostname)
```

## Repository and installation

```bash
echo "deb http://download.proxmox.com/debian/pve trixie pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
curl -fsSL https://enterprise.proxmox.com/debian/proxmox-release-trixie.gpg -o /etc/apt/trusted.gpg.d/proxmox-release-trixie.gpg
apt update
apt install -y proxmox-ve postfix open-iscsi
reboot
```

The lab used the no-subscription Proxmox repository on Debian 13.
