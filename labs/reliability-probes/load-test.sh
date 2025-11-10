#!/bin/sh
while true
do
  curl long-load-reliability-probes.apps.lab.okd.local/health
  sleep 2s
done
