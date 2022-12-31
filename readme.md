## The whisk dockerfile  
The purpose of this repository is to provide a container to run Janelia's whisker tracking software (whisk) and Chris Rodgers's wrapping functions (WhiskiWrap). The code base is cloned from Ariel Iporre's Python3-updated repositories: 
https://github.com/aiporre/whisk
https://github.com/aiporre/WhiskiWrap  

# Example calls: 
docker run --rm -v $(pwd):/data -t whisk-ww \
python -c "import WhiskiWrap; WhiskiWrap.pipeline_trace('test.mp4', 'output.hdf5', n_trace_processes=12)"

mkdir whiski_wrap_session
docker run --rm -v $(pwd):/data -t whisk-ww \
python -c "import WhiskiWrap; from WhiskiWrap import FFmpegReader; \
WhiskiWrap.interleaved_reading_and_tracing(FFmpegReader('/data/test.mp4'),'whiski_wrap_session', h5_filename='output.hdf5',n_trace_processes=20)"

## test container
`docker run -t whisk bash -c "trace"` should return:  
trace: Too few required arguments
Usage: trace <movie:string> <prefix:string>

## run trace
docker run -v <data directory>:/data -t whisk bash -c "trace <file name>.tif <file name>.whiskers"

If running directly from the data directory, you can <data directory> by `%cd%` (Windows cmd), `${PWD}` (PowerShell), or `$(pwd)` (Linux). 
E.g.: `docker run -v $(pwd):/data -t whisk bash -c "trace <file name>.tif <file name>.whiskers"`

## run measure
`docker run -v <data directory>:/data -t whisk bash -c "measure --face <face_x_y> x <file name>.whiskers <file name>.measurements"`

## run classify
`docker run -v <data directory>:/data -t whisk bash -c "classify <file name>.measurements <file name>.measurements <face_x_y> x --px2mm <px/mm ratio> -n <num_whiskers> --limit2.0:50.0'"`
