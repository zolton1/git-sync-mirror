FROM registry.suse.com/bci/bci-base:15.5

ARG USER=default

ENV HOME /home/${USER}
ENV APP=git_sync
ENV APP_ROOT=/${HOME}/${APP}
ENV PATH=${APP_ROOT}/bin:${PATH}

RUN zypper --non-interactive in git openssh-clients
RUN useradd -m ${USER}

USER ${USER}

RUN mkdir -p /${APP_ROOT}
COPY bin/ /${APP_ROOT}/

WORKDIR ${APP_ROOT}
CMD ["git-sync-mirror.sh"]