FROM alpine AS builder
WORKDIR /app

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community --no-cache git go
RUN git clone https://github.com/klzgrad/forwardproxy && \
    go get -u github.com/caddyserver/xcaddy/cmd/xcaddy && \
    # https://github.com/klzgrad/naiveproxy/issues/112
    ~/go/bin/xcaddy build HEAD --with github.com/caddyserver/forwardproxy=$PWD/forwardproxy

###

FROM alpine

COPY --from=builder /app/caddy /usr/bin/caddy
CMD /usr/bin/caddy run -config /etc/naiveproxy/caddy.json
