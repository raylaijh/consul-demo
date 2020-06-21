#!/bin/sh
set -o xtrace

########### Clear consul.d/*

rm consul.d/*


### Create web service config in consul.d

echo '{
  "service": {
    "name": "web",
    "tags": [
      "rails"
    ],
    "port": 80
  }
}' > ./consul.d/web.json


########## check for service in consul.d directory

consul agent -dev -enable-script-checks -config-dir=./consul.d

##### Check DNS records created for web service
#dig @127.0.0.1 -p 8600 web.service.consul  # in format NAME.service.consul
#dig @127.0.0.1 -p 8600 web.service.consul SRV ## SRV record created as well
#dig @127.0.0.1 -p 8600 rails.web.service.consul ## Query via tag as well
#curl http://localhost:8500/v1/catalog/service/web # Quary via API

