#!/bin/bash

# Build Docker image (PyPI-based: pip installs whisk-janelia[ffmpeg] + WhiskiWrap,
# no source build / conda env / whisk-base needed). See Dockerfile-ww.
docker build -t wanglabneuro/whisk-ww:latest -t wanglabneuro/whisk-ww:v1.2 -f Dockerfile-ww .

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
        # CONVERT THE IMAGE THAT WAS JUST BUILT, NOT THE ONE IN THE REGISTRY.
        #
        # `docker://` fetches from Docker Hub, so this step silently depended on
        # the `docker push` above having succeeded. If it hasn't (that happened)
        # apptainer converted the previous registry image instead. 
        # The result was a .sif holding an deprecated WhiskiWrap version with 
        # none of the chanegs and fixes, built minutes after a
        # local image that had them, reported as a successful build. The
        # Dockerfile's build-time assertion could not catch it: that assertion
        # ran, and passed, in the local image this step then ignored.
        #
        # `docker-daemon://` takes the local image directly, so the .sif is the
        # thing that was just verified.
        apptainer build -F whisk-ww-latest.sif docker-daemon://wanglabneuro/whisk-ww:latest
        # docker logout

        # VERIFY THE .sif ITSELF, NOT THE IMAGE IT WAS SUPPOSED TO COME FROM.
        # The Dockerfile asserts the linking fixes at build time, which says
        # nothing about what ended up in the .sif if the conversion took its
        # input from somewhere else. This is the same assertion, run on the
        # artefact that actually gets shipped -- and it is a hard stop, because
        # the failure it guards against is silent in every downstream result.
        if ! apptainer exec whisk-ww-latest.sif python -c "import inspect,sys; from importlib.metadata import version; import wwutils.classifiers.hmm_link as h, wwutils.classifiers.detection_features as d, WhiskiWrap.base as b; C=[(h,'_labels_look_like_identities'),(h,'_sig_cost'),(h,'track_weight'),(h,'c_groups'),(d,'_SHAPE_SCALAR_COLS'),(b,'measurement_by_key')]; m=[k for o,k in C if k not in inspect.getsource(o)]; sys.exit('.sif holds WhiskiWrap '+version('WhiskiWrap')+' and lacks: '+', '.join(m)) if m else print('.sif verified: WhiskiWrap '+version('WhiskiWrap')+', linking fixes present')"; then
            echo "REFUSING to publish this .sif -- it does not contain the linking fixes." >&2
            exit 1
        fi

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