#!/bin/bash

docker run --rm -d -p 873:873 \
  --volume="$PWD/repository/:/home/rsync/" \
  --volume="$PWD/rsyncd.conf:/etc/rsyncd.conf" \
  nicmxlabs/rsync
