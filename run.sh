#!/bin/bash

# docker run -it --rm \
#   -e DISPLAY:$DISPLAY \
#   --net host \
#   -v /tmp/.X11-unix:/tmp/.X11-unix \
#   --device /dev/snd \
# ozlevka/go-test
docker run -d \
      -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
      -v $XAUTHORITY:/developer/.Xauthority \
      -e DISPLAY=$DISPLAY \
      -e XAUTHORITY=/developer/.Xauthority \
      -p 5000:5000 \
      --device /dev/snd \
      --name docker-vscode \
      --entrypoint "urxvt" \
      cmiles74/docker-vscode