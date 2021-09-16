#!/bin/bash

for x in "$@"; do
  pushd "$x"
  ls *.bin > MULTIDISC.LST
  echo "../GameShark Video Game Enhancer Version 5 (USA) (Unl)/GameShark Video Game Enhancer Version 5 (USA) (Unl).bin" >> MULTIDISC.LST
  unix2dos MULTIDISC.LST
  popd
done
