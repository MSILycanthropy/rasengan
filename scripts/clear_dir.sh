#!/bin/bash
if [ "$(ls -A $1)" ]; then
  echo "Removing files in $1..."

  rm -rf $1
  mkdir $1
else
  echo "No files to remove in $1"
fi
