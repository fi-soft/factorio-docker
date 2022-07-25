from alpine:latest as download
arg download_link
workdir /opt
run apk update && apk upgrade && apk add curl
run curl -L -o factorio_headless.tar.xz $download_link
run tar -xvf factorio_headless.tar.xz
run tar -czvf factorio_headless.tar.gz factorio

from frolvlad/alpine-glibc:alpine-3.14 as factorio
copy --from=download /opt/factorio_headless.tar.xz /opt/factorio_headless.tar.xz
copy launch_server.sh /opt/
cmd ash /opt/launch_server.sh
