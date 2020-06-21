#!/bin/sh
set -o xtrace

### Remove intention to block communication to socat

consul intention delete web socat

#### trying to connect again 

#nc 127.0.0.1 9191


