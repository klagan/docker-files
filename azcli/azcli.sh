#!/bin/bash

# docker build --tag kaml/azcli .
docker run -it --rm -v $(pwd):/var/tmp --env K_az=$1 mytools/azcli