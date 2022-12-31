
## test container
`docker run -t whisk bash -c "trace"` should return:  
trace: Too few required arguments
Usage: trace <movie:string> <prefix:string>

## run trace
docker run -v <data directory>:/data -t whisk bash -c "trace <file name>.mp4 <file name>.whiskers"

If running directly from the data directory, you can <data directory> by `%cd%` (Windows cmd), `${PWD}` (PowerShell), or `$(pwd)` (Linux). 
E.g.: `docker run -v $(pwd):/data -t whisk bash -c "trace <file name>.mp4 <file name>.whiskers"`

## run measure
`docker run -v <data directory>:/data -t whisk bash -c "measure --face <face_x_y> x <file name>.whiskers <file name>.measurements"`

## run classify
`docker run -v <data directory>:/data -t whisk bash -c "classify <file name>.measurements <file name>.measurements <face_x_y> x --px2mm <px/mm ratio> -n <num_whiskers> --limit2.0:50.0'"`
