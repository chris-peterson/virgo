#!/bin/bash

tag='chris-peterson/virgo:local'
docker build -t $tag .

docker run --env FOO_VAR='bar' --env INPUT_TEMPLATES='./data/example.json' -v $PWD/tests:/data -it $tag
