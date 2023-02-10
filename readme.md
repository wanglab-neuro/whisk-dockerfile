# Using the whisker tracking container

The purpose of this repository is to provide containers to run [Janelia's whisker tracking software](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1002591) and Chris Rodgers's wrapping functions (WhiskiWrap).  

The images are publicly available on DockerHub, so you don't have to build the containers yourself (unless you want to make changes to it). 
Example command: `docker run --rm -t wanglabneuro/whisk trace movie.mp4 movie.whiskers`.  

1. whisk-base
Containers with only the whisk binaries are found on [wanglabneuro/whisk-base](https://hub.docker.com/r/wanglabneuro/whisk-base/tags).
The original `whisk` binary package is used in [whisk-base:legacy](https://hub.docker.com/layers/wanglabneuro/whisk-base/legacy/images/sha256-4c02e9d24ced38a05dd4ff182382177eb829ff93ed70a8bbbb17cd856b63863e?context=explore), which can be downloaded with `docker pull wanglabneuro/whisk-base:legacy`.
This is the ELF 64-bit LSB, for GNU/Linux 2.6.15, that is available [on Dropbox] (https://www.dropbox.com/s/1dr7g8x270xdrup/whisk-1.1.0d-64bit-Linux.tar.gz?dl=1). 

A new build is available in `whisk-base:0.0.4` (also `whisk-base:latest`). The code base for this build is Mitch Clough's fork of the original `whisk` repo: https://github.com/mitchclough/whisk.git/. To get it, run `docker pull wanglabneuro/whisk-base:latest`.  

2. whisk-ww
Containers with `whisk` and `WhiskiWrap` are found on [wanglabneuro/whisk-ww](https://hub.docker.com/r/wanglabneuro/whisk-ww/tags).
The code bases are Ariel Iporre's Python3-updated repositories:  
https://github.com/aiporre/whisk and https://github.com/aiporre/WhiskiWrap.  


## Example calls using WhiskiWrap
Basic tracing:

```bash
docker run --rm -v $(pwd):/data -t wanglabneuro/whisk-ww \
python -c "import WhiskiWrap; WhiskiWrap.pipeline_trace('test.mp4', 'output.hdf5', n_trace_processes=12)"
```

`$(pwd)` stands for the current directory, assuming this is the data directory. On Windows, use `%cd%` from the Command Prompt, or `${PWD}` from PowerShell.  
More efficient tracing function (`interleaved_reading_and_tracing`).  

```bash
mkdir whiski_wrap_session  
  
docker run --rm -v $(pwd):/data -t wanglabneuro/whisk-ww \
python -c "import WhiskiWrap; from WhiskiWrap import FFmpegReader; \
WhiskiWrap.interleaved_reading_and_tracing(FFmpegReader('/data/test.mp4'),'whiski_wrap_session', h5_filename='output.hdf5',n_trace_processes=20)"
```

The input video file can be any format that a default ffmpeg install can read.

Below are a some functions of interest, with a short preview of what they do:  

`trace_chunk`  
 command = [whisk_path + 'trace', raw_video_filename, whiskers_file]  

`measure_chunk`  
 command = ['measure', '--face', face, raw_whiskers_filename, measurements_file]  

`trace_and_measure_chunk`  
 trace_command = [whisk_path + 'trace', raw_video_filename, whiskers_file]  
 measure_command = ['measure', '--face', face, whiskers_file, measurements_file]  

`pipeline_trace` (deprecated)
 trace_chunk, ...  
 measure_chunk_star, ...  
 append_whiskers_to_hdf5(...  

`interleaved_read_trace_and_measure`  
 trace_and_measure_chunk,...  
 append_whiskers_to_hdf5(...  

`interleaved_reading_and_tracing`  
 trace_chunk,...  
 append_whiskers_to_hdf5(...  

To list functions within the WiskiWrap module:  
`docker run --rm -t wanglabneuro/whisk-ww python -c "import WhiskiWrap as ww; print(dir(ww))"`  

## Example calls using Janelia's whisker tracking code
The `whisk` binaries from `whisk-base` can read 8-bit grayscale StreamPix (Norpix Sequence Format: SEQ), TIFF, MPEG, MOV, and AVI formatted video.
Note that the wrapping functions described above generate tiff files.  
`whisk-base` containers have issues with some specific encodings (e.g., movies encoded with -nvenc_h264), although `whisk-base:legacy` works well on most cases. If a container returns an error, you may need to convert the movie first with `ffmpeg -i input_movie.mp4 conv_movie.mp4`.   

### run trace

`docker run -v <data directory>:/data -t wanglabneuro/whisk-base bash -c "trace <file name>.tif <file name>.whiskers"`  

If running directly from the data directory, you can change <data directory> by `%cd%` (Windows cmd), `${PWD}` (PowerShell), or `$(pwd)` (Linux).
E.g.: `docker run -v $(pwd):/data -t wanglabneuro/whisk-base bash -c "trace <file name>.tif <file name>.whiskers"`

### run measure

`docker run -v <data directory>:/data -t wanglabneuro/whisk-base bash -c "measure --face <face_x_y> x <file name>.whiskers <file name>.measurements"`

### run classify

`docker run -v <data directory>:/data -t wanglabneuro/whisk-base bash -c "classify <file name>.measurements <file name>.measurements <face_x_y> x --px2mm <px/mm ratio> -n <num_whiskers> --limit2.0:50.0'"`

## Test the container

`docker run --rm -t wanglabneuro/whisk-base trace` should return:  

```bash
trace: Too few required arguments  
Usage: trace <movie:string> <prefix:string>
```
