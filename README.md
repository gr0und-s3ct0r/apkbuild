# apkbuild
docker container for building apk packages for alpine linux distribution

## Usage
```shell
$ docker run \
    -it \
    -v /tmp/testing:./testing \
    -e "PACKAGER=Your Name <your@email.com>" \
    --rm \
    4383/apkbuild \
    newapkbuild test
```

## Useful links
- [create alpine linux packages](https://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package)
- [propose new packages](https://github.com/alpinelinux/aports)
- [official packages list](https://pkgs.alpinelinux.org/packages)
