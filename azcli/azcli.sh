#!/bin/bash

docker run -it --rm -v $(pwd):/var/tmp --env K_az=$1 kaml/azcli