# Juroku Next Docker Image

## Notes

This Dockerfile contains everything that is required for Juroku to run. Based on Alpine Linux.

Juroku's original repo is located at https://github.com/tmpim/juroku

## Server instructions

```sh
docker pull upsilondev/juroku-server
docker run -d -p 9999:9999 upsilondev/juroku-server
```

## ComputerCraft dependencies

- [jurokunext.lua](https://gist.github.com/1lann/42bc03fca89c980917f9bb74152f57fa)
- [video.lua](https://gist.github.com/1lann/87b7610d32131a14ee2c5c047d26a7ce)
- [audio.lua](https://gist.github.com/1lann/87b7610d32131a14ee2c5c047d26a7ce)
