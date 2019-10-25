FROM alpine as prezto-devel
LABEL maintainer="h@hlo.mx"
RUN apk --no-cache update && apk upgrade && \
    apk add util-linux pciutils usbutils coreutils binutils\
    findutils grep man man-pages mdocml-apropos less less-doc \
    make grep zsh zsh-vcs zsh-zftp zsh-calendar zsh-doc git \
    vim git-zsh-completion tmux tmux-zsh-completion \
    docker-zsh-completion
RUN addgroup prezto && adduser -D prezto -G prezto -S /bin/zsh
WORKDIR /home/prezto
USER prezto
RUN cd /home/prezto && mkdir src
COPY . src
RUN cp src/Makefile .
RUN make .clone
RUN make src .homercs
# ENTRYPOINT ["/bin/zsh", "-"]
# CMD ["/bin/zsh","-l","-o","verbose","-o","xtrace","-o","sourcetrace"]
CMD ["/bin/zsh","-l"]




