#!/bin/bash

for x in "$@"; do
  echo "$x"|grep -q '(Disc 1)' || continue
  gamefolder=`echo "$x"|sed "s/ (Disc 1)//"`
  mv "$x" "$gamefolder"
  IFS=$'\n'
  for x in `find * -name "${x/Disc 1/Disc [2-9]}"`; do
    mv "$x"/* "$gamefolder"
    rmdir "$x"
  done
done

