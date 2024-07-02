#!/bin/bash
echo "Combining upscaled frames to $1..."
ffmpeg -hide_banner -v quiet -stats -r 23.98 -i out_frames/frame%08d.jpg -i "$1" -map 0:v -map 1:a -map 1:s -c:v libx264 -r 23.98 -pix_fmt yuv420p "$2"
