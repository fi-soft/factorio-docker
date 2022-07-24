from alpine:latest as download
arg download_link
workdir /opt
run apk update && apk upgrade && apk add curl
run curl -L -o factorio_headless.tar.xz $download_link
run tar -xvf factorio_headless.tar.xz
run tar -czvf factorio_headless.tar.gz factorio

from debian:buster-slim as factorio
copy --from=download /opt/factorio_headless.tar.gz /opt/factorio_headless.tar.gz
