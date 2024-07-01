#!/bin/bash

TMP_DIR="tmp_frames"
OUT_DIR="out_frames"

PROCESS_CMD="bash scripts/upscale.sh $1"

if ! command -v pv &> /dev/null
then
    echo "pv could not be found. Please install pv to use this script."
    exit 1
fi

file_count() {
    local dir=$1
    find "$dir" -type f | wc -l
}

cleanup() {
    kill $process_pid
    exit 1
}

trap cleanup SIGINT

$PROCESS_CMD &
process_pid=$!

tmp_count=$(file_count "$TMP_DIR")
while true; do
    out_count=$(file_count "$OUT_DIR")

    echo -ne "\rProcessing: $out_count / $tmp_count"

    if ! kill -0 $process_pid 2> /dev/null; then
        break
    fi

    if [ "$tmp_count" -eq "$out_count" ]; then
        break
    fi

    sleep 0.5
done

wait $process_pid
