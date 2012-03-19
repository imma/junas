#!/bin/bash

cmd_vi=$(which vim 2>&-)
[[ -x $cmd_vi ]] || cmd_vi=$(which mvim 2>&-)

if [[ -x $cmd_vi ]]; then
  alias vi="$cmd_vi -X"
  export EDITOR="$cmd_vi -X"
fi
