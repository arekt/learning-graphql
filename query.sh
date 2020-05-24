#!/bin/bash
peco queries.txt --exec "ruby --disable-gems query.rb | jq -C '.' | less -r"

