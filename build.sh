#!/bin/sh

# Download Juroku Next
git clone -b next https://github.com/tmpim/juroku

# Build it
docker pull upsilondev/golang-gcc:latest
docker run --rm -u 1000 -v "$PWD/juroku":/tmp/juroku -w /tmp/juroku/stream/server \
-e GOCACHE='/tmp/go' -e GO_CFLAGS_ALLOW='.*' -e CGO_LDFLAGS_ALLOW='.*' -e CC='gcc' upsilondev/golang-gcc:latest go build

# Cleanup
#mv juroku/stream/server/server .
#rm -rf juroku/
