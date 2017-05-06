# Date : 
# Mon Apr 24 17:24:58 EDT 2017
 
 
loc_path=..
loc_lib = 
loc_include_path=$(loc_path)/include
loc_lib_path=$(loc_path)/lib
include $(loc_include_path)/makefile.inc 
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
 
 
 
 
 
 
LIBS    =  -L$(loc_lib_path)     $(loc_lib) $(makefile_inc_libs)
INCLUDES = -I$(loc_include_path) $(makefile_inc_includes)
 
 
# The name of the exe_filecutable file
EXE = zz 
 
# give a name of static libarary 
STATIC_LIB = libXXX.a
 
# Installing directory  
PREFIX = $(HOME)/Linux
 
# ------------------------------------------------ 
# To link the object_fileect files
 
 
MAIN_OBJS = memory_report_r8_test.o timestamp_test.o \
 \
 \
 \



OBJS = memory_report_r8.o timestamp.o \
 \
 \
 \



All : memory_report_r8_test.exe timestamp_test.exe     
 
memory_report_r8_test.exe  : $(OBJS) memory_report_r8_test.o   
	$(EC) $(FLAGS) -o memory_report_r8_test.exe   memory_report_r8_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
timestamp_test.exe  : $(OBJS) timestamp_test.o   
	$(EC) $(FLAGS) -o timestamp_test.exe   timestamp_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
memory_report_r8.o : memory_report_r8.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  memory_report_r8.f90
 
memory_report_r8_test.o : memory_report_r8_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  memory_report_r8_test.f90
 
timestamp.o : timestamp.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  timestamp.f90
 
timestamp_test.o : timestamp_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  timestamp_test.f90
 
 
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
	cp *.o ../lib	||: 
	cp  *.mod    ../include ||: 
	cp  *.h  ../include  ||:
 
# ------------------------------------------------ 
#make  clean
 
clean : 
	rm *.swp  core.* *.mod gmon.out
cleanall : 
	rm $(OBJS) .*.swp *.swo core.* gmon.out $(STATIC_LIB) *.mod   zz 
