#!/bin/sh
set -o xtrace

### Create web service config in consul.d, which is dependend on socat side-car proxy at listening at port 9191

echo '{
  "service": {
    "name": "web",
    "port": 80,
    "connect": {
      "sidecar_service": {
        "proxy": {
          "upstreams": [
            {
              "destination_name": "socat",
              "local_bind_port": 9191
            }
          ]
        }
      }
    }
  }
}' > ./consul.d/web.json

########## reload consul

consul reload

##### Check that socat proxy is not reachable at port 9191 yet

#nc 127.0.0.1 9191



