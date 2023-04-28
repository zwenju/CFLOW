# Date : 
# Fri May  5 13:22:25 EDT 2017
 
 
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
 
 
MAIN_OBJS = triangle_dunavant_quadrature_rule_test.o \
 \
 \
 \



OBJS = i4_wrap_modp.o Quadrature_Rule_Type_H.o quadrature_write.o triangle_dunavant_quadrature_rule.o \
 \
 \
 \



All : zz 
zz : $(OBJS) triangle_dunavant_quadrature_rule_test.o   
	$(EC) $(FLAGS) -o zz triangle_dunavant_quadrature_rule_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
i4_wrap_modp.o : i4_wrap_modp.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  i4_wrap_modp.f90
 
Quadrature_Rule_Type_H.o : Quadrature_Rule_Type_H.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  Quadrature_Rule_Type_H.f90
 
quadrature_write.o : quadrature_write.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  quadrature_write.f90
 
triangle_dunavant_quadrature_rule.o : triangle_dunavant_quadrature_rule.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_dunavant_quadrature_rule.f90
 
triangle_dunavant_quadrature_rule_test.o : triangle_dunavant_quadrature_rule_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_dunavant_quadrature_rule_test.f90
 
 
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
