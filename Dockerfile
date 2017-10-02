FROM alpine:latest
LABEL maintainer="herveberaud.pro@gmail.com"

ENV PACKAGER="Sebastien Boyron <sebastien@boyron.eu>" \
    USERNAME="packager"

RUN apk update && apk --no-cache add \
    alpine-sdk

RUN adduser -S -g abuild $USERNAME
RUN echo "$USERNAME:$USERNAME" | chpasswd 
RUN echo "$USERNAME     ALL=(ALL) ALL" > /etc/sudoers
RUN echo 'PACKAGER="$PACKAGER"' > /etc/abuild.conf

RUN addgroup $USERNAME abuild

RUN mkdir -p /var/cache/distfiles
RUN chmod a+w /var/cache/distfiles
RUN chgrp abuild /var/cache/distfiles 
RUN chmod g+w /var/cache/distfiles

RUN chmod 777 /home/packager

USER $USERNAME
WORKDIR /home/packager

RUN abuild-keygen -a -i
