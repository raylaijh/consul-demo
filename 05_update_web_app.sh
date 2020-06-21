#!/bin/sh
set -o xtrace

### Update web service config in consul.d
### curl for abituary port for health check

echo '{
  "service": {
    "name": "web",
    "tags": [
      "rails"
    ],
    "port": 80,
    "check": {
      "args": [
        "curl",
        "localhost:333"   
      ],
      "interval": "10s"
    }
  }
}' > ./consul.d/web.json

########## reload config after update
consul reload

##### Check DNS records created for web service, should not return any records if health check failed
dig @127.0.0.1 -p 8600 web.service.consul  # in format NAME.service.consul

