#!/usr/bin/env bash

set -Eeuo pipefail
trap cleanup SIGINT SIGTERM ERR EXIT

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

usage() {
  cat << EOF # remove the space between << and EOF, this is due to web plugin issue
Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-d] [-r] [-s]

Manage website development.

Available options:

-h, --help      Print this help and exit
-d, --deploy    Deploy the website with hugo
-r, --restart   Restart local server to update changes
-s, --start     Start local server
-c, --clean     Clean all the cache, remove all containers
EOF
  exit
}

cleanup() {
  trap - SIGINT SIGTERM ERR EXIT
  # script cleanup here
}

deploy() {
    docker-compose -f docker-compose.deploy.yml build
    docker-compose -f docker-compose.deploy.yml up
}

develop() {
    docker-compose -f docker-compose.develop.yml build
    docker-compose -f docker-compose.develop.yml up
}

restart() {
    docker restart e-commerce_stefano_1
}

clean() {
    docker-compose -f docker-compose.develop.yml down

}

die() {
  local msg=$1
  local code=${2-1} # default exit status 1
  msg "$msg"
  exit "$code"
}

parse_params() {
  # default values of variables set from params
  flag=0
  param=''

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -d | --deploy) deploy ;;
    -s | --start) develop ;;
    -r | --restart) develop ;;
    -c | --clean) clean ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  args=("$@")

  # check required params and arguments
  [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  return 0
}

parse_params "$@"
