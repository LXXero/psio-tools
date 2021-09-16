#!/bin/bash

out="$1"

shift

for x in "$@"; do
  filelist=`unzip -lqq "$x"`
  folder="${x%.zip}"
  if [ `echo "$filelist"|grep "\.bin$"|wc -l` -gt "1" ]; then
    echo "$folder is multi-bin"
    mkdir -p "$out/$folder"
    unzip -d "$out/$folder/orig" "$x"
    pushd "$out/$folder"
    pushd "orig"
    binmerge -o ../ *.cue "$folder" || break
    popd
    cue2cu2.py *.cue || break
    rm -rf orig
    popd
  else
    echo "$folder is single-bin"
    unzip -d "$out/$folder" "$x"
    pushd "$out/$folder"
    cue2cu2.py *.cue || break
    popd
  fi
done
