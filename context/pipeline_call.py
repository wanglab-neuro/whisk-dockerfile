import sys,os
import WhiskiWrap

print("\n", sys.argv[0], 'calling WhiskiWrap.pipeline_trace with arguments:', end = " ")
for i in range(1, len(sys.argv)):
   print(sys.argv[i], end = " ")
   
WhiskiWrap.pipeline_trace(sys.argv[1:])