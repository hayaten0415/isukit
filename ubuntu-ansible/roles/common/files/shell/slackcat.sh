#!/bin/sh
cp /dev/null /var/log/mysql/slow_query.log
cp /dev/null /var/log/nginx/access.log
sudo pt-query-digest /var/log/mysql/slow_query.log | slackcat --channel meshi
sudo alp -f /var/log/nginx/access.log | slackcat --channel meshi
