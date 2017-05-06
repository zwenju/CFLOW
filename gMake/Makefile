# Date : 
# Fri Apr 14 22:38:47 PDT 2017
 
 
loc_path=../../src
loc_lib = libPaper1.a
include $(loc_path)/makefile.inc 
EC  = mpif90 
CC  = mpicc  
CXX = mpicxx 
FC  = mpif90 
 
CFLAGS  =  -fbounds-check -Wall -Wextra -g -g3 -finit-local-zero  -fexternal-blas
FFLAGS  =  -fbounds-check -Wall -Wextra -g -g3 -finit-local-zero  -fexternal-blas
FLAGS   =  -fbounds-check -Wall -Wextra -g -g3 -finit-local-zero  -fexternal-blas
 
#CFLAGS  =  -fbounds-check -finit-local-zero  -fexternal-blas -O3
#FFLAGS  =  -fbounds-check -finit-local-zero  -fexternal-blas -O3
#FLAGS   =  -fbounds-check -finit-local-zero  -fexternal-blas -O3
 
 
 
 
 
 
LIBS =  $(loc_path)/$(loc_lib) $(makefile_inc_libs)
INCLUDES = -I$(loc_path) $(makefile_inc_includes)
 
 
# The name of the exe_filecutable file
EXE = zz 
 
# give a name of static libarary 
STATIC_LIB = libXXX.a
 
# Installing directory  
PREFIX = $(HOME)/Linux
 
# ------------------------------------------------ 
# To link the object_fileect files
 
 
MAIN_OBJS = amain.o atest.o \
 \
 atest.o \
 \



OBJS = a.o \
 \
a.o \
a.o \



All : amain.exe atest.exe   atest.exe   
 
amain.exe  : amain.o    $(OBJS)
	$(EC) $(FLAGS) -o amain.exe   amain.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
atest.exe  : atest.o    $(OBJS)
	$(EC) $(FLAGS) -o atest.exe   atest.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
atest.exe  : atest.o    $(OBJS)
	$(EC) $(FLAGS) -o atest.exe   atest.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
a.o : a.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  a.f90
 
amain.o : amain.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  amain.f90
 
atest.o : atest.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  atest.f90
 
a.o : a.c 
	$(CC) $(CFLAGS) $(INCLUDES) -c  a.c
 
atest.o : atest.c 
	$(CC) $(CFLAGS) $(INCLUDES) -c  atest.c
 
a.o : a.cc 
	$(CXX) $(CFLAGS) $(INCLUDES) -c  a.cc
 
 
# ------------------------------------------------ 
# make run 
 
run : 
	./$(EXE)
 
# ------------------------------------------------ 
# make ar 
 
ar : 
	ar rcs $(STATIC_LIB) $(OBJS)
 
# ------------------------------------------------ 
# make gdb 
 
ulimit : 
	ulimit -c unlimted 
 
gdb : 
	gdb ./$(EXE) core.* 
 
# ------------------------------------------------ 
#make gprof 
 
gprof :
	gprof -l -b ./$(EXE) gmon.prof
 
# ------------------------------------------------ 
#make  ctags
 
ctags : 
	ctags -R 
 
# ------------------------------------------------ 
#make  install
 
install : 
	install $(STATIC_LIB) $(PREFIX)/lib 
 
# ------------------------------------------------ 
#make  clean
 
clean : 
	rm *.swp  core.* *.mod gmon.out
cleanall : 
	rm $(OBJS) .*.swp *.swo core.* gmon.out $(STATIC_LIB) *.mod   zz 
