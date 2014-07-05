#!/usr/bin/zsh

if [[ ! $# -gt 1 ]]; then
  echo "Usage: vgrep <term> <list of directories>"
  exit 1;
fi

grep -cr "${1}" "${@:2}" | grep -v :0
