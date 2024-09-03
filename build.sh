#!/bin/bash

## To create whisk and whisk-wrapper containers, based on legacy whisk build

# docker build -t wanglabneuro/whisk-base:legacy -f Dockerfile-legacy context
# docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:ob-0.0.2 -f Dockerfile-ww-ob context

## To create whisk and whisk-wrapper containers, based on new whisk build

# docker build -t wanglabneuro/whisk-base:latest -t wanglabneuro/whisk-base:0.1.0 -f Dockerfile-whisk context
# docker build -t wanglabneuro/whisk-base:latest -t wanglabneuro/whisk-base:0.2.2 -f Dockerfile-whisk-mex context
docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:nb-0.2.7 -f Dockerfile-ww-nb context 
# --no-cache

## Potential future build
# docker build -t wanglabneuro/whisk-ww:nb-0.3.0 -f Dockerfile-ww .


## Versions:
# whisk-ww:nb-0.2.7 - WhiskiWrap 1.2.0, whisk-janelia 1.1.10 
# whisk-ww:nb-0.2.6 - WhiskiWrap 1.1.11, whisk-janelia 1.1.10 
 
# Test with docker run --rm -it wanglabneuro/whisk-ww:nb-0.2.7 /bin/bash, or singularity run docker://wanglabneuro/whisk-ww:nb-0.2.7 /bin/bash