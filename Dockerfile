FROM alpine:3.19.1

ARG USER=default
ENV HOME /home/$USER
ENV APP=git_sync_mod
ENV APP_ROOT=/${HOME}/${APP}

RUN apk --no-cache add openssh-client git bash

RUN adduser -D $USER

USER $USER
WORKDIR $HOME

CMD mkdir -p /${APP_ROOT}
COPY bin/ /${APP_ROOT}/
