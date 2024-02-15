FROM alpine:3.19.1

ARG USER=default

ENV HOME /home/${USER}
ENV APP=git_sync
ENV APP_ROOT=/${HOME}/${APP}
ENV PATH=${APP_ROOT}/bin:${PATH}

RUN apk --no-cache add openssh-client git bash

RUN adduser -D ${USER}

USER ${USER}

RUN mkdir -p /${APP_ROOT}
COPY bin/ /${APP_ROOT}/

WORKDIR ${APP_ROOT}
CMD ["git-sync-mirror.sh"]