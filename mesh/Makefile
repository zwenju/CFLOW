# Date : 
# Sun Apr 16 13:30:35 EDT 2017
 
 
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
 
 
MAIN_OBJS = triangle_test.o \
 \
 \
 \



OBJS = Mesh_Type_H.o triangle_build_edgelist_info.o triangle_read_mesh.o triangle_save_mesh.o triangle_save_mesh_py.o triangle_uniform_refinement.o triangle_write_mesh.o \
 \
 \
 \



All : zz 
zz : $(OBJS) triangle_test.o   
	$(EC) $(FLAGS) -o zz triangle_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
Mesh_Type_H.o : Mesh_Type_H.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  Mesh_Type_H.f90
 
triangle_build_edgelist_info.o : triangle_build_edgelist_info.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_build_edgelist_info.f90
 
triangle_read_mesh.o : triangle_read_mesh.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_read_mesh.f90
 
triangle_save_mesh.o : triangle_save_mesh.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_save_mesh.f90
 
triangle_save_mesh_py.o : triangle_save_mesh_py.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_save_mesh_py.f90
 
triangle_test.o : triangle_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_test.f90
 
triangle_uniform_refinement.o : triangle_uniform_refinement.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_uniform_refinement.f90
 
triangle_write_mesh.o : triangle_write_mesh.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_write_mesh.f90
 
 
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
