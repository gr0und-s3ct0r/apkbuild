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
