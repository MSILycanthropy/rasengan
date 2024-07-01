#!/bin/bash
ffmpeg -hide_banner -v quiet -stats -r 23.98 -i out_frames/frame%08d.jpg -i "$1" -map 0:v:0 -map 1:a:0 -map 1:s:0 -c:a copy -c:v libx264 -r 23.98 -pix_fmt yuv420p "$2"
