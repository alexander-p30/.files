#!/bin/bash

DETECTED=$(autorandr --detected)
CURRENT=$(autorandr --current)

if [[ $DETECTED != $CURRENT ]]; then
  autorandr -l $(autorandr --detected)
fi

nitrogen --restore

if command -v nvidia-settings; then nvidia-settings --load-config-only; fi
