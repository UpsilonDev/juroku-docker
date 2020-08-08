FROM alpine:3.12

WORKDIR /usr/bin/

COPY juroku-server /usr/bin
RUN apk add libgomp ffmpeg youtube-dl \
    && addgroup -g 1000 -S juroku \
    && adduser -u 1000 -S juroku -G juroku

EXPOSE 9999
USER juroku
CMD ["juroku-server"]
