from alpine:latest as download
workdir /opt
run apk update && apk upgrade && apk add curl
run curl -L -o factorio_headless.tar.xz https://factorio.com/get-download/stable/headless/linux64

from alpine:latest as factorio
copy --from=download /opt /opt
