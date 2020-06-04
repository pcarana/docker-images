#!/bin/sh

docker run --rm -itd --privileged --volume="$PWD/conf/:/etc/frr/" --name frr frrouting/frr:latest
