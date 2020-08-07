FROM ubuntu:focal

ENV TZ="UTC"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y \
  && apt install git gcc-8 golang ffmpeg python3-pip -y \
  && pip3 install youtube-dl \
  && git clone https://github.com/tmpim/juroku \
  && cd juroku && git checkout next && cd stream/server \
  && CGO_CFLAGS_ALLOW=.* CGO_LDFLAGS_ALLOW=.* CC="gcc-8" go build \
  && mv server /usr/bin/juroku-server

EXPOSE 9999

CMD ["juroku-server"]
