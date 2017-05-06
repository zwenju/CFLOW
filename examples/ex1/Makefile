# Date : 
# Fri May  5 23:15:16 EDT 2017
 
 
loc_path=../..
loc_lib = -lcflow
loc_include_path=$(loc_path)/include
loc_lib_path=$(loc_path)/lib
include $(loc_include_path)/makefile.inc 
EC  = mpif90 
CC  = mpicc  
CXX = mpicxx 
FC  = mpif90 
 
CFLAGS  =  -fbounds-check -Wall -Wextra  -v -g -pg -finit-local-zero  -fexternal-blas
FFLAGS  =  -fbounds-check -Wall -Wextra  -v -g -pg -finit-local-zero  -fexternal-blas
FLAGS   =  -fbounds-check -Wall -Wextra  -v -g -pg -finit-local-zero  -fexternal-blas
 
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
 
 
MAIN_OBJS = zmain_elliptic_2d.o \
 \
 \
 \



OBJS = A_Global_H.o apply_boundary_condition.o fespace_init.o getLoc2GlobalIndex.o make_coo_sparsity_pattern.o save_mesh_solution.o solve_system.o t3_reference_to_physical_fem.o user_exact_solution.o user_right_hand_sides.o \
 \
 \
 \



All : zz 
zz : $(OBJS) zmain_elliptic_2d.o   
	$(EC) $(FLAGS) -o zz zmain_elliptic_2d.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
A_Global_H.o : A_Global_H.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  A_Global_H.f90
 
apply_boundary_condition.o : apply_boundary_condition.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  apply_boundary_condition.f90
 
fespace_init.o : fespace_init.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  fespace_init.f90
 
getLoc2GlobalIndex.o : getLoc2GlobalIndex.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  getLoc2GlobalIndex.f90
 
make_coo_sparsity_pattern.o : make_coo_sparsity_pattern.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  make_coo_sparsity_pattern.f90
 
save_mesh_solution.o : save_mesh_solution.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  save_mesh_solution.f90
 
solve_system.o : solve_system.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  solve_system.f90
 
t3_reference_to_physical_fem.o : t3_reference_to_physical_fem.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  t3_reference_to_physical_fem.f90
 
user_exact_solution.o : user_exact_solution.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  user_exact_solution.f90
 
user_right_hand_sides.o : user_right_hand_sides.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  user_right_hand_sides.f90
 
zmain_elliptic_2d.o : zmain_elliptic_2d.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  zmain_elliptic_2d.f90
 
 
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
