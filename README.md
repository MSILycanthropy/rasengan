# rasengan

A small set of shell scripts for running ffmpeg and [Real-ESRGAN](https://github.com/xinntao/Real-ESRGAN) to upscale anime.

## Usage

First clone the repo and get in the right directory.

Then get it all setup,

```sh
> chmod +x ./kagebunshin.sh
> ./kage_bunshin.sh windows # windows or ubuntu
```

Put all the videos in the `inputs` directory. MKV is the preferred format. But,
any should work.

Then run the upscaler with the desired amount

```sh
> ./rasengan.sh 4
```

Yay now all your upscaled anime is in the `outputs` directory.

## License

Rasengan is released under the [MIT License](https://opensource.org/licenses/MIT).
