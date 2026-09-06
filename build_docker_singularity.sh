#!/bin/bash

# Build Docker image (PyPI-based: pip installs whisk-janelia[ffmpeg] + WhiskiWrap,
# no source build / conda env / whisk-base needed). See Dockerfile-ww.
docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:v1.1 -f Dockerfile-ww .

# Push to Docker registry
docker push --all-tags wanglabneuro/whisk-ww

# Convert Docker image to Singularity image
# Requires Singularity installed on your system.
if ! command -v apptainer &> /dev/null
then
    echo "apptainer could not be found"
    echo "Please install apptainer from https://apptainer.org/docs/admin/main/installation.html#install-ubuntu-packages"
    exit
else
    # If a hash file exists, check the hash matches the current Docker image. If not, build a new Singularity image.
    if [ -f "whisk-ww-latest.sif.hash" ]; then
        if [ "$(docker inspect wanglabneuro/whisk-ww:latest --format='{{.Id}}')" == "$(cat whisk-ww-latest.sif.hash)" ]; then
            echo "Docker image has not changed. Not building Singularity image."
            build_singularity=0
        else
            echo "Docker image has changed. Building Singularity image."
            build_singularity=1
        fi
    else
        echo "Hash file not found. Building Singularity image."
        build_singularity=1
    fi
          
    if [ $build_singularity -eq 1 ]; then
        echo "Building Singularity image."
        # docker login
        apptainer build -F whisk-ww-latest.sif docker://wanglabneuro/whisk-ww:latest 
        # docker logout
        # store a hash of the Docker image in a file
        docker inspect wanglabneuro/whisk-ww:latest --format='{{.Id}}' > whisk-ww-latest.sif.hash
    fi    
            
fi

# If the .env script exists, get the HPCC_IMAGE_REPO variable
if [ -f ".env" ]; then
    echo "Get server information from .env file."
    set -a
    source .env
    set +a
    export SSH_HPCC_IMAGE_REPO="${SSH_NODE}:${HPCC_IMAGE_REPO}"
fi

# check if hppc_image_repo variable exists and .sif file was built
if [ -n "${SSH_HPCC_IMAGE_REPO+x}" ]; then
    if [ -f "whisk-ww-latest.sif" ]; then
        echo "Copying Singularity image to HPCC."
        rsync -aP whisk-ww-latest.sif "$SSH_HPCC_IMAGE_REPO/" # -z compression flag tends to screw up the transfer when using the script. May not be necessary anyway.
    else
        echo "Singularity image not found. Skipping copy to HPCC."
    fi
else
    echo "HPPC_IMAGE_REPO variable not set. Not copying to HPPC."
fi