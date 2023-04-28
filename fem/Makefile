# Date : 
# Thu May  4 20:58:34 EDT 2017
 
 
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
 
 
MAIN_OBJS = \
 \
 \
 \



OBJS = FEM_SPACE_TYPE_H.o t3_lagrange_p1_2d.o t3_lagrange_p2_2d.o t3_physical_to_reference_pts.o t3_reference_to_physical_basis_dx.o t3_reference_to_physical_fem.o t3_reference_to_physical_pts.o t3_triangle_area.o \
 \
 \
 \



All : zz 
zz : $(OBJS)
	$(EC) $(FLAGS) -o zz $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
FEM_SPACE_TYPE_H.o : FEM_SPACE_TYPE_H.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  FEM_SPACE_TYPE_H.f90
 
t3_lagrange_p1_2d.o : t3_lagrange_p1_2d.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  t3_lagrange_p1_2d.f90
 
t3_lagrange_p2_2d.o : t3_lagrange_p2_2d.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  t3_lagrange_p2_2d.f90
 
t3_physical_to_reference_pts.o : t3_physical_to_reference_pts.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  t3_physical_to_reference_pts.f90
 
t3_reference_to_physical_basis_dx.o : t3_reference_to_physical_basis_dx.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  t3_reference_to_physical_basis_dx.f90
 
t3_reference_to_physical_fem.o : t3_reference_to_physical_fem.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  t3_reference_to_physical_fem.f90
 
t3_reference_to_physical_pts.o : t3_reference_to_physical_pts.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  t3_reference_to_physical_pts.f90
 
t3_triangle_area.o : t3_triangle_area.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  t3_triangle_area.f90
 
 
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
