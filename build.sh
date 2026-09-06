#!/bin/bash

## To create whisk and whisk-wrapper containers, based on legacy whisk build

# docker build -t wanglabneuro/whisk-base:legacy -f Dockerfile-legacy context
# docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:ob-0.0.2 -f Dockerfile-ww-ob context

## To create whisk and whisk-wrapper containers, based on new whisk build

# docker build -t wanglabneuro/whisk-base:latest -t wanglabneuro/whisk-base:0.1.0 -f Dockerfile-whisk context
# docker build -t wanglabneuro/whisk-base:latest -t wanglabneuro/whisk-base:0.2.2 -f Dockerfile-whisk-mex context
# docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:nb-0.2.9 -f Dockerfile-ww-nb context
docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:v1.2 -f Dockerfile-ww .

#  --no-cache

## Potential future build
# docker build -t wanglabneuro/whisk-ww:nb-0.3.0 -f Dockerfile-ww .

## Versions:
# whisk-ww:v1.2 - WhiskiWrap 1.2.9, whisk-janelia 1.2.5. Fixes cross-chunk
#   stitching (identity swaps and 60-678 spurious global ids) and the whisker
#   count, which 1.2.6-1.2.8 took from classify's per-segment labels: on the
#   ground-truth clips that gave 28-37 whiskers per side instead of 3, and HMM
#   linking then produced NO output at all, silently falling back to the
#   geometry linker. Identity accuracy against GT: none -> 0.92 / 0.97.
# whisk-ww:v1.1 - WhiskiWrap 1.2.8, whisk-janelia 1.2.5. PyPI-based (Dockerfile-ww): pip install only, no source build / conda / whisk-base. Includes the learned coverage model (--learned); whisk auto-downloads+preloads its FFmpeg libs on import.
# whisk-ww:v1.0 - WhiskiWrap 1.2.6, whisk-janelia 1.2.5. PyPI-based (Dockerfile-ww): pip install only, no source build / conda / whisk-base. Includes the learned coverage model (--learned); whisk auto-downloads+preloads its FFmpeg libs on import.
# whisk-ww:nb-0.2.9 - WhiskiWrap 1.2.1, whisk-janelia 1.1.10. Adds seaborn and plotly for convenience.
# whisk-ww:nb-0.2.8 - WhiskiWrap 1.2.1, whisk-janelia 1.1.10
# whisk-ww:nb-0.2.7 - WhiskiWrap 1.2.0, whisk-janelia 1.1.10 
# whisk-ww:nb-0.2.6 - WhiskiWrap 1.1.11, whisk-janelia 1.1.10 
 
# Test with docker run --rm -it wanglabneuro/whisk-ww:latest /bin/bash, or singularity run docker://wanglabneuro/whisk-ww:nb-0.2.7 /bin/bash