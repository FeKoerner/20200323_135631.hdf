#!/bin/bash

# test internet speed over time

# check credentials
eval $(ssh-agent)
ssh-add /home/pi/.ssh/id_github
sleep 10
# file for results
CSV=speed_results.csv

speedtest --csv-header >> $CSV
while true; do
    speedtest --server 23610 --csv >> $CSV
    git add .
    git commit -m "speedtest result upload"
    git push
    sleep 5m
done
