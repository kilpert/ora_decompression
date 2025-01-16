#!/usr/bin/env bash

[ -d "$1" ] && cd "$1"

find . -type f -name "*" ! -path "./checksum.md5" -exec md5sum "{}" + | sort -k2,2 >"checksum.md5"
