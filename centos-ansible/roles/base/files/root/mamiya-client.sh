#!/bin/bash

cd ~
tar xzf mamiyapack.tar.gz

cd mamiyapack

for path in $(find . -type f); do
  echo cp "$path" "$(echo ${path} | sed -E 's/^\.//')"
  cp "$path" "$(echo ${path} | sed -E 's/^\.//')"
done
