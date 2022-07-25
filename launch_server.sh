#!/bin/ash

cd /opt
tar -xvf factorio_headless.tar.xz
./factorio/bin/x64/factorio --create map
./factorio/bin/x64/factorio --start-server map

