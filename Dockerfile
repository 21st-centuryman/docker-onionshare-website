FROM alpine:latest

ENV ONIONSHARE_VERSION=2.6.1
ENV PIPX_BIN_DIR=/usr/local/bin

RUN apk update && apk add --no-cache tor pipx

RUN pipx install onionshare-cli==$ONIONSHARE_VERSION

VOLUME ["/shared"]

ENTRYPOINT ["/usr/local/bin/onionshare-cli", "--public", "--website", "--persistent", "/shared/persistent.txt"]
CMD ["/shared"]
