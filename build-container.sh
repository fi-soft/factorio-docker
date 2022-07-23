#!/bin/bash

DOC="build-container.sh: Facilitates building a docker container image for a headless Factorio server.

Usage: 
  build-container.sh
  build-container.sh --help
  build-container.sh <version> [--tag=<tag>]

Options:
  -h, --help    Display this message
  --tag=<tag>   Sets the tag for the docker image
"

ARCHIVE_PAGE="https://factorio.com/download/archive/"
DOWNLOAD_PAGE="https://factorio.com/get-download/"
DOWNLOAD_LINK=""
DOWNLOAD_SUFFIX="/headless/linux64"
AVAILABLE_VERSIONS=""
DOCKER_TAG="latest"
VERSION_TAG=""

function list_server_versions() {
  # Let's just parse some HTML with regex.  What could go wrong?
  AVAILABLE_VERSIONS=$(curl -s $ARCHIVE_PAGE | grep "download/archive" | grep "href" | cut -d\" -f2 | cut -d\" -f1 | cut -d\/ -f4)
}

function set_download_link_to_version() {
  VERSION=$1
  DOWNLOAD_LINK="${DOWNLOAD_PAGE}${VERSION}${DOWNLOAD_SUFFIX}"
  VERSION_TAG=$VERSION
}

function build_container() {
  eval "$(docopt.sh --parser "$0")"
  eval "$(docopt "$@")"
  if [ -z $_version_ ]; then
    list_server_versions
    LATEST_VERSION=${AVAILABLE_VERSIONS[0]}
    set_download_link_to_version $LATEST_VERSION
  else
    set_download_link_to_version $_version_
    VERSION_TAG=$_version_
  fi
  
  docker build -f factorio.dockerfile --target factorio --build-arg download_link=${DOWNLOAD_LINK} --tag ${VERSION_TAG} .
  echo $DOWNLOAD_LINK
}

build_container "$@"
