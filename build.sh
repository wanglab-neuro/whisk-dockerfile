#!/bin/bash

## To create whisk and whisk-wrapper containers, based on legacy whisk build
docker build -t wanglabneuro/whisk-base:legacy -f Dockerfile-legacy context
docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:ob-0.0.2 -f Dockerfile-ww-ob context

## To create whisk and whisk-wrapper containers, based on new whisk build
docker build -t wanglabneuro/whisk-base:latest -t wanglabneuro/whisk-base:0.0.4 -f Dockerfile-whisk context
docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:nb-0.0.1 -f Dockerfile-ww-nb context



