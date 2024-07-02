#!/bin/bash
if [ -n "$1" ]; then
  valid_platforms=("windows" "macos" "ubuntu")
  valid=false

  for item in "${valid_platforms[@]}"; do
    if [[ "$item" == "$1" ]]; then
      valid=true
      break
    fi
  done

  if $valid; then
    PLATFORM=$1
  else
    echo "$1 is not a valid platform (${valid_platforms[@]})"
    exit 1
  fi
else
  PLATFORM="windows"
fi

OUT_DIR=executables/realesrgan
URL=$(
  curl -s https://api.github.com/repos/xinntao/Real-ESRGAN/releases \
    | grep "browser_download_url" \
    | grep "$PLATFORM.zip" \
    | head -n 1 \
    | cut -d : -f 2,3 \
    | tr -d \" \
)
FILE=$(basename $URL)

echo $URL | wget -O $FILE -qi - | wait

if [ -f "$FILE" ]; then
  mkdir $OUT_DIR
  echo "Unzipping $FILE..."
  unzip $FILE -d $OUT_DIR >/dev/null 2>&1
  rm -rf $FILE
  echo "All done."
else
  echo "Something went wrong.. please try again."
fi

chmod +x ./rasengan.sh
chmod +x executables/realesrgan/realesrgan-ncnn-vulkan.exe
