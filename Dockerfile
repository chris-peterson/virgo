FROM alpine:3.14.1

RUN apk add curl

# https://github.com/a8m/envsubst#linux-and-macos
RUN curl -L https://github.com/a8m/envsubst/releases/download/v1.2.0/envsubst-`uname -s`-`uname -m` -o envsubst && \
    chmod +x envsubst && \
    mv envsubst /usr/local/bin

ADD [ "entrypoint.sh", "/" ]

ENTRYPOINT [ "/entrypoint.sh" ]