#!/bin/bash

DOC="build-container.sh: Facilitates building a docker container image for a headless Factorio server.

Usage: 
  build-container.sh
  build-container.sh <version> [--tag=<tag>]

Options:
  --tag=<tag>   Sets the tag for the docker image
"

ARCHIVE_PAGE="https://factorio.com/download/archive/"
DOWNLOAD_LINK=""
AVAILABLE_VERSIONS=""
DOCKER_TAG="latest"
VERSION_TAG=""

function list_server_versions() {
  # Let's just parse some HTML with regex.  What could go wrong?
  AVAILABLE_VERSIONS=$(curl -s $ARCHIVE_PAGE | grep "download/archive" | grep "href" | cut -d\" -f2 | cut -d\" -f1 | cut -d\/ -f4)
}

function set_download_link_to_version() {
  VERSION=$1
  DOWNLOAD_LINK="${ARCHIVE_PAGE}${VERSION}"
}

eval "$(docopt "$0")"

if $version; then
  set_download_link_to_version $version
else
  list_server_versions
  LATEST_VERSION=${AVAILABLE_VERSIONS[0]}
  set_download_link_to_version $LATEST_VERSION
fi

echo $DOWNLOAD_LINK


