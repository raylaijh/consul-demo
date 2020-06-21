#!/bin/sh
set -o xtrace

### Discover nodes

consul members

####### Discover node info via API

curl localhost:8500/v1/catalog/nodes

###### Check dynamically created DNS records created by consul

dig @127.0.0.1 -p 8600 $(hostname).node.consul





