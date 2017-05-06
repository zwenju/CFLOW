# Date : 
# Sat Apr 22 19:35:35 EDT 2017
 
 
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
 
 
MAIN_OBJS = tetrahedron_arbq_quadrature_rule_test.o tetrahedron_felippa_quadrature_rule_test.o triangle_lyness_quadrature_rrule_test.o \
 \
 \
 \



OBJS = circle_quadrature_rule.o i4_wrap_modp.o legendre_rule.o reference_to_physical_t3.o tetrahedron_arbq_rule.o tetrahedron_felippa_quadrature_rule.o timestamp.o triangle_area.o triangle_dunavant_quadrature_rule.o triangle_lyness_quadrature_rule.o \
 \
 \
 \



All : tetrahedron_arbq_quadrature_rule_test.exe tetrahedron_felippa_quadrature_rule_test.exe triangle_lyness_quadrature_rrule_test.exe     
 
tetrahedron_arbq_quadrature_rule_test.exe  : $(OBJS) tetrahedron_arbq_quadrature_rule_test.o   
	$(EC) $(FLAGS) -o tetrahedron_arbq_quadrature_rule_test.exe   tetrahedron_arbq_quadrature_rule_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
tetrahedron_felippa_quadrature_rule_test.exe  : $(OBJS) tetrahedron_felippa_quadrature_rule_test.o   
	$(EC) $(FLAGS) -o tetrahedron_felippa_quadrature_rule_test.exe   tetrahedron_felippa_quadrature_rule_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
triangle_lyness_quadrature_rrule_test.exe  : $(OBJS) triangle_lyness_quadrature_rrule_test.o   
	$(EC) $(FLAGS) -o triangle_lyness_quadrature_rrule_test.exe   triangle_lyness_quadrature_rrule_test.o    $(OBJS)  $(INCLUDES)  $(LIB_PATH) $(LIBS)

 

 
 
# 
# *********************************************************** 
# To compile the source files 
# 
 
circle_quadrature_rule.o : circle_quadrature_rule.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  circle_quadrature_rule.f90
 
i4_wrap_modp.o : i4_wrap_modp.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  i4_wrap_modp.f90
 
legendre_rule.o : legendre_rule.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  legendre_rule.f90
 
reference_to_physical_t3.o : reference_to_physical_t3.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  reference_to_physical_t3.f90
 
tetrahedron_arbq_quadrature_rule_test.o : tetrahedron_arbq_quadrature_rule_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  tetrahedron_arbq_quadrature_rule_test.f90
 
tetrahedron_arbq_rule.o : tetrahedron_arbq_rule.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  tetrahedron_arbq_rule.f90
 
tetrahedron_felippa_quadrature_rule.o : tetrahedron_felippa_quadrature_rule.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  tetrahedron_felippa_quadrature_rule.f90
 
tetrahedron_felippa_quadrature_rule_test.o : tetrahedron_felippa_quadrature_rule_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  tetrahedron_felippa_quadrature_rule_test.f90
 
timestamp.o : timestamp.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  timestamp.f90
 
triangle_area.o : triangle_area.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_area.f90
 
triangle_dunavant_quadrature_rule.o : triangle_dunavant_quadrature_rule.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_dunavant_quadrature_rule.f90
 
triangle_lyness_quadrature_rrule_test.o : triangle_lyness_quadrature_rrule_test.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_lyness_quadrature_rrule_test.f90
 
triangle_lyness_quadrature_rule.o : triangle_lyness_quadrature_rule.f90 
	$(FC) $(FFLAGS) $(INCLUDES) -c  triangle_lyness_quadrature_rule.f90
 
 
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
