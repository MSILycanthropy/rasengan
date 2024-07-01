#!/bin/bash
if [ "$(ls -A $1)" ]; then
  echo "Removing files in $1..."

  if command -v pv >/dev/null 2>&1; then
    rm -v $1/* | pv -l -s $( du -a $1 | wc -l ) > /dev/null
  else
    rm $1/*
  fi
else
  echo "No files to remove in $1"
fi
