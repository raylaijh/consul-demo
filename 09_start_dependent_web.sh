#!/bin/sh
set -o xtrace

### start web proxy with sidecar
consul connect proxy -sidecar-for web

########## Try to connect to socat again on port 9191
#### pretending to be web app tallking but actually talking from localhost
#### This will check for sidecar availability at port 9191

#nc 127.0.0.1 9191


