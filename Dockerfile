FROM alpine:latest

ENV PIPX_BIN_DIR=/usr/local/bin

RUN apk update && apk add --no-cache tor pipx gcc linux-headers python3-dev musl-dev

RUN pipx install onionshare-cli

VOLUME ["/shared"]

ENTRYPOINT ["/usr/local/bin/onionshare-cli", "--public", "--website", "--persistent", "/shared/persistent.txt"]
CMD ["/shared"]
