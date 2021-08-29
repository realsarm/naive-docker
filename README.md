# Naïve Docker

Run [NaïveProxy](https://github.com/klzgrad/naiveproxy) in Docker.

## Requirements

- [Docker](https://docs.docker.com/engine/)
- [Docker Compose](https://docs.docker.com/compose/)

## Usage

1. Fill out [Caddy config](config/Caddyfile)
2. Put your certificate at `config/cert.pem` and key at `config/key.pem`
3. Build the image with `docker build -t naive .`
4. Start with `docker-compose up -d`
