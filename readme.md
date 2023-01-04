# Using the whisker tracking container

The purpose of this repository is to provide a container to run [Janelia's whisker tracking software](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1002591) and Chris Rodgers's wrapping functions (WhiskiWrap). The code base is cloned from Ariel Iporre's Python3-updated repositories:  
<https://github.com/aiporre/whisk>  
<https://github.com/aiporre/WhiskiWrap>  

The image is publicly available [here](https://hub.docker.com/r/wanglabneuro/whisk), so you don't have to build the container yourself (unless you want to make changes to it). When using the image from the DockerHub, just change `-t whisk` to `-t wanglabneuro/whisk`.  
e.g.: `docker run --rm -t wanglabneuro/whisk trace`.

## Example calls using WhiskiWrap

Basic tracing:

```bash
docker run --rm -v $(pwd):/data -t whisk \
python -c "import WhiskiWrap; WhiskiWrap.pipeline_trace('test.mp4', 'output.hdf5', n_trace_processes=12)"
```

`$(pwd)` stands for the current directory, assuming this is the data directory. On Windows, use `%cd%` from the Command Prompt, or `${PWD}` from PowerShell.  
More efficient tracing function (`interleaved_reading_and_tracing`).  

```bash
mkdir whiski_wrap_session  
  
docker run --rm -v $(pwd):/data -t whisk \
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
`docker run --rm -t wanglabneuro/whisk python -c "import WhiskiWrap as ww; print(dir(ww))"`  

## Example calls using Janelia's whisker tracking code

In theory, the code can read 8-bit grayscale StreamPix (Norpix Sequence Format: SEQ), TIFF, MPEG, MOV, and AVI formatted video.
In practice, this is often not the case. For example, pre-built Windows binaries that used to be available [online](http://whiskertracking.janelia.org) could read .mp4 files. The compiled version here does not (at least not in my hands - if you know how to solve this, please get in touch). It can read tiff files, however, such as those generated by the wrapping functions.

### run trace

`docker run -v <data directory>:/data -t whisk bash -c "trace <file name>.tif <file name>.whiskers"`  

If running directly from the data directory, you can change <data directory> by `%cd%` (Windows cmd), `${PWD}` (PowerShell), or `$(pwd)` (Linux).
E.g.: `docker run -v $(pwd):/data -t whisk bash -c "trace <file name>.tif <file name>.whiskers"`

### run measure

`docker run -v <data directory>:/data -t whisk bash -c "measure --face <face_x_y> x <file name>.whiskers <file name>.measurements"`

### run classify

`docker run -v <data directory>:/data -t whisk bash -c "classify <file name>.measurements <file name>.measurements <face_x_y> x --px2mm <px/mm ratio> -n <num_whiskers> --limit2.0:50.0'"`

## Test the container

`docker run --rm -t whisk trace` should return:  

```bash
trace: Too few required arguments  
Usage: trace <movie:string> <prefix:string>
```
