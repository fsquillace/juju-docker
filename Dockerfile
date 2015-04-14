

FROM base/archlinux
MAINTAINER Filippo Squillace <feel.squally@gmail.com>


RUN pacman --noconfirm -Sy && pacman -S pacman --noconfirm && pacman-db-upgrade && \
        pacman -Syy --noconfirm && \
        pacman -S --noconfirm archlinux-keyring && \
        pacman-key --init && \
        pacman-key --populate archlinux && \
        pacman --noconfirm -S git arch-install-scripts base-devel libunistring && \
        useradd juju -m && \
        echo "juju ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER juju

RUN mkdir -p /tmp/package-query && cd /tmp/package-query && curl -J -O https://aur.archlinux.org/packages/pa/package-query/PKGBUILD && makepkg -fsc --noconfirm

WORKDIR /tmp/package-query
USER root

RUN pacman --noconfirm -U package-query-*.tar.xz

RUN mkdir /juju && chown juju /juju

USER juju
WORKDIR /juju

ENTRYPOINT git clone https://github.com/fsquillace/juju.git && ./juju/bin/juju -b -n
