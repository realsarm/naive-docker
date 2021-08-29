FROM alpine AS builder
WORKDIR /app

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community --no-cache git go
RUN go get -u github.com/caddyserver/xcaddy/cmd/xcaddy && \
    ~/go/bin/xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive

###

FROM alpine

COPY --from=builder /app/caddy /usr/bin/caddy
CMD /usr/bin/caddy run -config /etc/naiveproxy/Caddyfile
