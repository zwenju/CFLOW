# Date : 
# Fri May  5 18:11:05 EDT 2017
 
 
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
 
 
MAIN_OBJS = csr_insert_sort_test.o \
 \
 \
 \



OBJS = A_Sparse_Matrix_Type_H.o coo_to_csc_col_ptr.o coo_to_csr_row_ptr.o csc_submatrix_location_idx.o csr_submatrix_location_idx.o csr_submatrix_location_idx_unordered.o sparse_matrix_free.o sparse_matrix_write.o \
 \
 \
 \



All : zz 
zz : $(OBJS) csr_insert_sort_test.o   
	$(EC) $(FLAGS) -o zz csr_insert_sort_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
A_Sparse_Matrix_Type_H.o : A_Sparse_Matrix_Type_H.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  A_Sparse_Matrix_Type_H.f90
 
coo_to_csc_col_ptr.o : coo_to_csc_col_ptr.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  coo_to_csc_col_ptr.f90
 
coo_to_csr_row_ptr.o : coo_to_csr_row_ptr.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  coo_to_csr_row_ptr.f90
 
csc_submatrix_location_idx.o : csc_submatrix_location_idx.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  csc_submatrix_location_idx.f90
 
csr_insert_sort_test.o : csr_insert_sort_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  csr_insert_sort_test.f90
 
csr_submatrix_location_idx.o : csr_submatrix_location_idx.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  csr_submatrix_location_idx.f90
 
csr_submatrix_location_idx_unordered.o : csr_submatrix_location_idx_unordered.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  csr_submatrix_location_idx_unordered.f90
 
sparse_matrix_free.o : sparse_matrix_free.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  sparse_matrix_free.f90
 
sparse_matrix_write.o : sparse_matrix_write.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  sparse_matrix_write.f90
 
 
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
