#!/bin/sh
set -o xtrace

### Test out socat

socat -v tcp-l:8181,fork exec:"/bin/cat"

########## check for service in consul.d directory

# nc 127.0.0.1 8181

