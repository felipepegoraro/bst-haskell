#!/bin/bash

_build(){
  ghc Main.hs -o main
}

_clean(){
  rm -f Main.hi Main.o Tree.hi Tree.o
}

_help(){
  cat <<EOF
[USAGE]
  ./sh [flags]

[FLAGS]
  -b   build
  -c   clean
  -h   help
EOF
}

if [[ ! -z "$@" ]]; then
  for i in "$@"; do
    case "$i" in
      -b) _build ;;
      -c) _clean ;;
      -h) _help  ;;
       *) 
         echo "invalid option: ${i/-/}" ;
         echo "try ./sh -h"
         exit 1
        ;;
    esac
  done
else
  _help
fi
