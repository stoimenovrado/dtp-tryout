#!/bin/bash
while true; do
  echo "Testing connection to DTP ...";
  if kubectl exec dtp -n parasoft-dtp-namespace -c dtp-server -- sh -c 'curl --write-out "%{http_code}" --silent --output /dev/null http://localhost:8080 | grep -q 200'; then
    echo "... connection test succeeded. DTP App is running.";
    break;
  else
    echo "... connection test failed. Sleep for 5s and retry.";
    sleep 5;
  fi
done