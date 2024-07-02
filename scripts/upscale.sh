#!/bin/bash
if [ -f "executables/realesrgan/realesrgan-ncnn-vulkan.exe" ]; then
  # executables/anime4k/Anime4KCPP_CLI.exe -i tmp_frames -o out_frames -z 4 -w -q -H
  EXECUTABLE=executables/realesrgan/realesrgan-ncnn-vulkan.exe
elif [ -f "executables/realesrgan/realesrgan-ncnn-vulkan" ]; then
  EXECUTABLE=executables/realesrgan/realesrgan-ncnn-vulkan
fi

$EXECUTABLE -i tmp_frames -o out_frames -s "$1" -f jpg -g 0 -j 4:4:4 > /dev/null 2>&1
