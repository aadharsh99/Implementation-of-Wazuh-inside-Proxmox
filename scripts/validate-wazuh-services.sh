#!/usr/bin/env bash
set -euo pipefail

echo '== Wazuh service status =='
systemctl --no-pager --full status wazuh-manager wazuh-indexer wazuh-dashboard filebeat || true

echo
echo '== Listening ports =='
ss -lntp | grep -E '(:443|:9200|:55000|:1514|:1515)' || true

echo
echo '== Wazuh rule syntax =='
/var/ossec/bin/wazuh-analysisd -t
