FROM alpine:3.12

WORKDIR /usr/bin/

COPY juroku-server /usr/bin
RUN apk add ffmpeg youtube-dl

EXPOSE 9999

CMD ["/usr/bin/juroku-server"]
