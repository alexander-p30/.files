#!/bin/bash
# taken from https://www.youtube.com/watch?v=zB_3FIGRWRU&pp=sAQA

numericDateToday=$(date +%Y-%m-%d)
timeNow=$(date +%H:%M)
noteFilename="$HOME/Documents/personal/notes/$numericDateToday.md"

if [ ! -f $noteFilename ]; then
  echo "# Notes for $numericDateToday" > $noteFilename
fi

nvim -c "norm Go" \
  -c "norm Go## $timeNow" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $noteFilename

