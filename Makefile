CXX = nvcc
CC = nvcc
CPPFLAGS=-I../include -I../include/libfreenect -I/usr/loca/cuda/include -I/opt/local/include -DLIBFREENECT_INTERFACE
CXXFLAGS=-g -m64 -O3 -use_fast_math
## -ptx -src-in-ptx
LDFLAGS=-g -m64 -L../lib -lfreenect -Xlinker -lglut -lGL -lGLU

%.o: %.cu
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $^

all: kinect test

test: kfusion.o helpers.o test.o

kinect: kfusion.o helpers.o kinect.o interface.o

clean:
	rm *.o test kinect
