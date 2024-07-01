#!/bin/bash
INPUT_DIR="./inputs"
OUTPUT_DIR="./outputs"

sh scripts/reset.sh
for FILE in "$INPUT_DIR"/*; do
  if [ -f "$FILE" ]; then
    bash scripts/split.sh "$FILE"
    bash scripts/upscale_monitored.sh "$1"
    bash scripts/combine.sh "$FILE" "${FILE/$INPUT_DIR/$OUTPUT_DIR}"
    bash scripts/reset.sh
  fi
done
