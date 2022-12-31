FROM continuumio/anaconda3

LABEL maintainer="Vincent Prevosto <prevosto@mit.edu>"

# Copy installation files
COPY packages packages

# Package installs
RUN apt update && \
    apt install -y --no-install-recommends \
    build-essential \
    cmake \
    mediainfo \
    libgl1-mesa-dev \
    ffmpeg \
    bison \
    gawk \
    nano && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
    
# Create environment for WhiskiWrap
RUN conda env create -f packages/whiski_wrap_env.yml

# Make RUN commands use the environment:
SHELL ["conda","run", "--no-capture-output", "-n","WhiskiWrap","/bin/bash","-c"]
RUN conda install --quiet --yes ipykernel && \
    python -m ipykernel install --user --name whiski_wrap --display-name "WhiskiWrap" 

RUN mkdir -p /root/dev
WORKDIR /root/dev
# Clone Ariel Iporre's whisk fork.
RUN git clone https://github.com/aiporre/whisk.git
# Clone Ariel Iporre's WhiskiWrap version
RUN git clone https://github.com/aiporre/WhiskiWrap.git
	
WORKDIR /root/dev/whisk/

# Run cmake configure & build process
RUN mkdir build
WORKDIR /root/dev/whisk/build
RUN cmake ..
RUN make

# add whisk binaries to path
ENV PATH="$PATH:/root/dev/whisk/build"
ENV WHISKPATH="/root/dev/whisk/bin/"

# Add the whisk package 
WORKDIR /root/dev/whisk/
RUN cp /root/dev/whisk/build/libwhisk.so /root/dev/whisk/
RUN rm -r bin/* && \
    cp -r build/* bin/
RUN pip install .

RUN export PACKDIR=$(python -c "import site; print(''.join(site.getsitepackages()))"); \
    cp /root/dev/whisk/build/libwhisk.so $PACKDIR/whisk/

# Add the WhiskiWrap package 
WORKDIR /root/dev/WhiskiWrap/
RUN pip install .

# Set WhiskiWrap as default environment
SHELL [ "/bin/bash", "--login",  "-c" ]
# ENV PATH=/opt/conda/bin:$PATH
ENV PATH /opt/conda/envs/WhiskiWrap/bin:$PATH
RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> /root/.profile && \
    conda init bash && conda activate WhiskiWrap && \
    echo "conda activate WhiskiWrap" >> ~/.bashrc

# Add entrypoint script (not working)
WORKDIR /root/dev/
COPY pipeline_call.py .

# Error when calling script, but not when executing code through python (python -c "import WhiskiWrap; WhiskiWrap.pipeline_trace('test.mp4', 'output.hdf5', n_trace_processes=4)") or ipython  
# Adding whisk module to Python path doesn't fix it
# RUN	echo "/root/dev/whisk/share" >> /opt/conda/envs/WhiskiWrap/lib/python3.7/site-packages/WhiskiWrap.pth
# export PYTHONPATH="${PYTHONPATH}:/opt/conda/envs/WhiskiWrap/lib/python3.7/site-packages/whisk"

WORKDIR /data

# Alternative entrypoints
# ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "WhiskiWrap", "python", "-c", "import WhiskiWrap; WhiskiWrap.pipeline_trace"]
# ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "WhiskiWrap", "/bin/bash", "-c"]
# ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "WhiskiWrap", "python", "/root/dev/pipeline_call.py"]

# Example calls: 
# docker run --rm -v $(pwd):/data -t whisk-ww \
# python -c "import WhiskiWrap; WhiskiWrap.pipeline_trace('test.mp4', 'output.hdf5', n_trace_processes=12)"

# mkdir whiski_wrap_session
# docker run --rm -v $(pwd):/data -t whisk-ww \
# python -c "import WhiskiWrap; from WhiskiWrap import FFmpegReader; \
# WhiskiWrap.interleaved_reading_and_tracing(FFmpegReader('/data/test.mp4'),'whiski_wrap_session', h5_filename='output.hdf5',n_trace_processes=20)"




