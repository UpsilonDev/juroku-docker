# Build Juroku from golang-gcc image
FROM upsilondev/golang-gcc:latest
WORKDIR /tmp/build

RUN git clone -b next https://github.com/tmpim/juroku && cd juroku/stream/server \
    && CGO_CFLAGS_ALLOW=.* CGO_LDFLAGS_ALLOW=.* CC="gcc-8" go build \
    && mv server /usr/bin/juroku-server

# todo: move server binary to seperate, clean container
