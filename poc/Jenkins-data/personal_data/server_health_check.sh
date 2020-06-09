#!/bin/sh

FILE=$1
MAX=$2

grep "Validation finished" $FILE | wc -l | awk -v MAX=$MAX '{ if ($1 < MAX) { exit 1 } }' && grep "Valid Prefixes" $FILE
