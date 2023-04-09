#!/bin/bash

url="http://some-site.ua"
log_file="status.log"

if [ ! -f "$log_file" ]; then
    touch $log_file
fi

status_code=$(curl -s -o /dev/null -w "%{http_code}" $url)

if [[ $status_code -lt 200 || $status_code -gt 399 ]]; then
    echo "$(date) - Status code: $status_code" >> $log_file
fi

