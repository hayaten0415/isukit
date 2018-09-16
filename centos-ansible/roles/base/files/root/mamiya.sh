#!/bin/bash

set -Cue -o pipefail

TARGET_HOSTS=(g1.isu g2.isu g3.isu)
declare -a pack="/root/mamiya-client.sh /root/isu /etc/nginx/nginx.conf /etc/nginx/conf.d /etc/my.cnf"

set -x

tar czvf mamiyapack.tar.gz --transform 's|^|/mamiyapack/|' ${pack}

for host in $TARGET_HOSTS; do
  rsync -avz mamiyapack.tar.gz root@${host}:~
done

set +x
