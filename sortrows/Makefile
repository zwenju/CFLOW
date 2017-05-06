# Date : 
# Thu May  4 11:28:42 EDT 2017
 
 
loc_path=..
loc_lib = 
loc_include_path=$(loc_path)/include
loc_lib_path=$(loc_path)/lib
include $(loc_include_path)/makefile.inc 
EC  = mpif90 
CC  = mpicc  

CC  = mpicc
CXX = mpicc
FC  = mpif90 
 
CFLAGS  = -D __USE_GNU  -fbounds-check -Wall -Wextra -g -g3 -finit-local-zero  -fexternal-blas
FFLAGS  = -D __USE_GNU  -fbounds-check -Wall -Wextra -g -g3 -finit-local-zero  -fexternal-blas
FLAGS   = -D __USE_GNU -fbounds-check -Wall -Wextra -g -g3 -finit-local-zero  -fexternal-blas
 
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
 
 
MAIN_OBJS = i4_sortrows_test.o \
 \
 qsort_STL_test.o \
 \



OBJS = \
 \
i4_sortrows.o i4_sortrows_reverse.o i4_unique_rows.o i4_write_rows.o \
 \



All : i4_sortrows_test.exe   qsort_STL_test.exe   
 
i4_sortrows_test.exe  : $(OBJS) i4_sortrows_test.o   
	$(EC) $(FLAGS) -o i4_sortrows_test.exe   i4_sortrows_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
qsort_STL_test.exe  : $(OBJS) qsort_STL_test.o   
	$(EC) $(FLAGS) -o qsort_STL_test.exe   qsort_STL_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
i4_sortrows_test.o : i4_sortrows_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  i4_sortrows_test.f90
 
i4_sortrows.o : i4_sortrows.c 
	$(CC) $(CFLAGS) $(INCLUDES) -c  i4_sortrows.c
 
i4_sortrows_reverse.o : i4_sortrows_reverse.c 
	$(CC) $(CFLAGS) $(INCLUDES) -c  i4_sortrows_reverse.c
 
i4_unique_rows.o : i4_unique_rows.c 
	$(CC) $(CFLAGS) $(INCLUDES) -c  i4_unique_rows.c
 
i4_write_rows.o : i4_write_rows.c 
	$(CC) $(CFLAGS) $(INCLUDES) -c  i4_write_rows.c
 
qsort_STL_test.o : qsort_STL_test.c 
	$(CC) $(CFLAGS) $(INCLUDES) -c  qsort_STL_test.c
 
 
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
	rm $(OBJS)  $(MAIN_OBJS)  .*.swp *.swo core.* gmon.out $(STATIC_LIB) *.mod   zz 
