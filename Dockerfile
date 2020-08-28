# Build Juroku
FROM upsilondev/golang-gcc:latest AS build

RUN mkdir /tmp/build && git clone -b next https://github.com/tmpim/juroku /tmp/build/juroku
WORKDIR /tmp/build/juroku/stream/server
RUN CGO_CFLAGS_ALLOW='.*' CGO_LDFLAGS_ALLOW='.*' CC='gcc' go build

# Pack Juroku
FROM alpine:3.12
WORKDIR /usr/bin/

COPY --from=build /tmp/build/juroku/stream/server/server /usr/bin
RUN apk add libgomp ffmpeg youtube-dl \
    && addgroup -g 1000 -S juroku \
    && adduser -u 1000 -S juroku -G juroku

EXPOSE 9999
USER juroku
CMD ["server"]
