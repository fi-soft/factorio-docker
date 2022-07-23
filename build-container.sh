#!/bin/bash

ARCHIVE_PAGE="https://factorio.com/download/archive/"
DOWNLOAD_LINK=""
AVAILABLE_VERSIONS=""

function list_server_versions() {
  # Let's just parse some HTML with regex.  What could go wrong?
  AVAILABLE_VERSIONS=$(curl -s $ARCHIVE_PAGE | grep "download/archive" | grep "href" | cut -d\" -f2 | cut -d\" -f1 | cut -d\/ -f4)
}

function set_download_link_to_version() {
  VERSION=$1
  DOWNLOAD_LINK="${ARCHIVE_PAGE}${VERSION}"
}

if [[ $# -ne 1 ]]; then
  list_server_versions
  LATEST_VERSION=${AVAILABLE_VERSIONS[0]}
  set_download_link_to_version $LATEST_VERSION
else
  set_download_link_to_version $1
fi

echo $DOWNLOAD_LINK
