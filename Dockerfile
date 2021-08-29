# Build Juroku
FROM upsilondev/golang-gcc:latest AS build

RUN apk add upx && mkdir -p /tmp/build/juroku && cd /tmp/build/juroku \
    && git clone -b next https://github.com/tmpim/juroku /tmp/build/juroku \
    && cd stream/server && CGO_CFLAGS_ALLOW='.*' CGO_LDFLAGS_ALLOW='.*' CC='gcc' \
    go build -ldflags="-s -w" && upx server && mv server juroku-server

# Pack Juroku
FROM alpine:3.12
WORKDIR /usr/bin/

COPY --from=build /tmp/build/juroku/stream/server/juroku-server /usr/bin
RUN apk add libgomp ffmpeg python3 py3-pip g++ \
    && pip install -U yt-dlp \
    && addgroup -g 1000 -S juroku \
    && adduser -u 1000 -S juroku -G juroku \
    && ln -s /usr/bin/yt-dlp /usr/bin/youtube-dl \
    && apk del g++

EXPOSE 9999
USER juroku
CMD ["juroku-server"]
