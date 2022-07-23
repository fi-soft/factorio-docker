from alpine:latest as download
arg download_link
workdir /opt
run apk update && apk upgrade && apk add curl
run curl -L -o factorio_headless.tar.xz $download_link

from alpine:latest as factorio
copy --from=download /opt /opt
