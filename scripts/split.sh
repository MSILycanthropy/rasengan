#!/bin/bashecho "Splitting $1 into individual frames..."
echo "Splitting up $1 into individual frames..."
ffmpeg -hide_banner -v quiet -stats -i "$1" -qscale:v 1 -qmin 1 -qmax 1 -vsync 0 tmp_frames/frame%08d.png
