DETECTED=$(autorandr --detected)
CURRENT=$(autorandr --current)

if [[ $DETECTED != $CURRENT ]]; then
  autorandr -l $(autorandr --detected)
fi

nitrogen --restore
