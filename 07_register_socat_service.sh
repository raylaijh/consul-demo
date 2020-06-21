#!/bin/sh
set -o xtrace

### Create socat service config in consul.d, note the sidecar proxy injected

echo '{
  "service": {
    "name": "socat",
    "port": 8181,
    "connect": {
      "sidecar_service": {}
    }
  }
}' > ./consul.d/socat.json

### reload consul config
consul reload

##### connect to socat side car proxy
consul connect proxy -sidecar-for socat
