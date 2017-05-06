# Date : 
# Mon Apr 24 23:51:41 EDT 2017
 
 
loc_path=..
loc_lib =  -lcflow 
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
 
 
MAIN_OBJS = matrix_sparsity_pattern_hash_test.o \
 \
 \
 \



OBJS =  \
 \
 \
matrix_sparsity_pattern_hash.o \



All : zz 
zz : $(OBJS) matrix_sparsity_pattern_hash_test.o   
	$(EC) $(FLAGS) -o zz matrix_sparsity_pattern_hash_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
matrix_sparsity_pattern_hash_FEM_sample.o : matrix_sparsity_pattern_hash_FEM_sample.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  matrix_sparsity_pattern_hash_FEM_sample.f90
 
matrix_sparsity_pattern_hash_test.o : matrix_sparsity_pattern_hash_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  matrix_sparsity_pattern_hash_test.f90
 
matrix_sparsity_pattern_hash.o : matrix_sparsity_pattern_hash.cc 
	$(CXX) $(CFLAGS) $(INCLUDES) -c  matrix_sparsity_pattern_hash.cc
 
 
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
