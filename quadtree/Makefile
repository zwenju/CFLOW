# Date : 
# Sat Apr 29 00:46:52 EDT 2017
 
 
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
 
 
MAIN_OBJS = mesh_quadtree_test.o \
 \
 \
 \



OBJS = A_Mesh_QuadTree_H.o mesh_quadtree_free.o mesh_quadtree_init.o mesh_quadtree_level_refine.o mesh_quadtree_subdivide.o mesh_quadtree_write.o mesh_quadtree_write_py.o \
 \
 \
 \



All : zz 
zz : $(OBJS) mesh_quadtree_test.o   
	$(EC) $(FLAGS) -o zz mesh_quadtree_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
A_Mesh_QuadTree_H.o : A_Mesh_QuadTree_H.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  A_Mesh_QuadTree_H.f90
 
mesh_quadtree_free.o : mesh_quadtree_free.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  mesh_quadtree_free.f90
 
mesh_quadtree_init.o : mesh_quadtree_init.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  mesh_quadtree_init.f90
 
mesh_quadtree_level_refine.o : mesh_quadtree_level_refine.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  mesh_quadtree_level_refine.f90
 
mesh_quadtree_subdivide.o : mesh_quadtree_subdivide.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  mesh_quadtree_subdivide.f90
 
mesh_quadtree_test.o : mesh_quadtree_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  mesh_quadtree_test.f90
 
mesh_quadtree_write.o : mesh_quadtree_write.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  mesh_quadtree_write.f90
 
mesh_quadtree_write_py.o : mesh_quadtree_write_py.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  mesh_quadtree_write_py.f90
 
 
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
