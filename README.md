# Docker container for [Lantern](https://lantern.io).

## TL;DR

1. Configure published ports in the `.env` file:
   ```
   UI_PORT=39331
   HTTP_PORT=39332
   SOCKS_PORT=39333
   ```

2. Create and run the container:
   ```
   docker compose up -d
   ```

3. Configure your apps to use HTTP `127.0.0.1:39332` or SOCKS `127.0.0.1:39333` proxy. Lantern's web interface is accessible at `http://127.0.0.1:39331`.

## Configuraion

Published ports can be configured using environment variables:
* `UI_PORT` - web interface port (internal port 80)
* `HTTP_PORT` - HTTP(S) port (internal port 8080)
* `SOCKS_PORT` - SOCKS port (internal port 1080)

If an environment variable isn't set, docker compose will choose a random port. You can use `docker compose port lantern <internal port>` command to find out the mapping.

A convenient way of setting variables for docker compose is an `.env` file.

## Help

I expect you to know what are you doing (You would not run code suggested by someone on the internet without understanding it, right? Right?), but if you have questions feel free to open an issue.
