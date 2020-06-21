#!/bin/sh
set -o xtrace

### create intention to block communication to socat

consul intention create -deny web socat

#### trying to connect again 

#nc 127.0.0.1 9191


