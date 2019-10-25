FROM alpine as prezto-devel
LABEL maintainer="h@hlo.mx"
RUN apk --no-cache update && apk upgrade && \
    apk add make grep zsh git
RUN addgroup prezto && adduser -D prezto -G prezto -S /bin/zsh
WORKDIR /home/prezto
USER prezto
RUN cd /home/prezto && mkdir src
COPY . src
RUN cp src/Makefile .
RUN make .clone
RUN make src .homercs
# ENTRYPOINT ["/bin/zsh", "-"]
CMD ["/bin/zsh","-l","-o","verbose","-o","xtrace","-o","sourcetrace"]




