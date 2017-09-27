FROM alpine:latest
LABEL maintainer="herveberaud.pro@gmail.com"

ENV PACKAGER="Hervé Beraud <herveberaud.pro@gmail.com>" \
    USERNAME="packager"

RUN apk update && apk add \
    alpine-sdk

RUN adduser --disabled-password $USERNAME
RUN echo "$USERNAME:$USERNAME" | chpasswd 
RUN echo "$USERNAME     ALL=(ALL) ALL" > /etc/sudoers
RUN echo 'PACKAGER="$PACKAGER"' > /etc/abuild.conf

USER $USERNAME

RUN sudo addgroup $USERNAME abuild
RUN sudo mkdir -p /var/cache/distfiles
RUN sudo chmod a+w /var/cache/distfiles
RUN sudo chgrp abuild /var/cache/distfiles 
RUN sudo chmod g+w /var/cache/distfiles

RUN abuild-keygen -a -i
