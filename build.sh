#!/bin/bash

docker build -t whisk:latest -t whisk:0.0.1 -f Dockerfile context
