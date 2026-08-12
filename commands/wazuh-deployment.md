# Wazuh Deployment Commands

## All-in-one installation

```bash
curl -sO https://packages.wazuh.com/4.14/wazuh-install.sh
sudo bash wazuh-install.sh -a
```

The assistant installs/configures Manager, Indexer, Dashboard and Filebeat, generates certificates and initializes indexer security.

## Service verification

```bash
sudo systemctl status wazuh-manager
sudo systemctl status wazuh-indexer
sudo systemctl status wazuh-dashboard
sudo systemctl status filebeat
sudo ss -lntp | grep -E '(:443|:9200|:55000|:1514|:1515)'
```

## Dashboard path

The documented lab path exposed external port `8443` through DNAT to Wazuh Dashboard HTTPS port `443` on `10.10.10.10`.
