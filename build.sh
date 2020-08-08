#!/bin/sh

# Download Juroku Next
git clone -b next https://github.com/tmpim/juroku

# Build it
docker pull golang
docker run --rm -v "$PWD/juroku":/tmp/juroku -w /tmp/juroku/stream/server \
-e CGO_CFLAGS_ALLOW='.*' -e CGO_LDFLAGS_ALLOW='.*' -e CC='gcc' upsilondev/golang-gcc:latest go build

# Cleanup
mv juroku/stream/server/server juroku-server
strip juroku-server
rm -rf juroku/
