#!/bin/bash
# executables/waifu2x/waifu2x-ncnn-vulkan.exe -i tmp_frames -o out_frames -s 2 -f jpg -g 0 -j 4:4:4
executables/realesrgan/realesrgan-ncnn-vulkan.exe -i tmp_frames -o out_frames -s "$1" -f jpg -g 0 -j 4:4:4 > /dev/null 2>&1
# executables/anime4k/Anime4KCPP_CLI.exe -i tmp_frames -o out_frames -z 4 -w -q -H
