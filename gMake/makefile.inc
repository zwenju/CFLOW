
mumps_dir = /home/wenju/Workspaces
 
 
mumps_lib =  -L$(mumps_dir)/MUMPS_5.0.2/lib   -ldmumps  -lmumps_common -lpord
metis_lib =  -L$(mumps_dir)/metis-5.1.0/build/Linux-x86_64/libmetis -lmetis 
scotch_lib=  -L$(mumps_dir)/scotch_6.0.4/lib -lesmumps -lscotch -lscotcherr
scalapack_lib = $(mumps_dir)/scalapack-2.0.2/libscalapack.a
 
 
mumps_include  = -I$(mumps_dir)/MUMPS_5.0.2/include
metis_include  = -I$(mumps_dir)/metis-5.1.0/include
scotch_include = -I$(mumps_dir)/scotch_6.0.4/include


#********************************************************************
# step 3 <intel Configuration>
Intel_PATH = /msdu/local/intel/mkl/lib/intel64
Intel_Include = -I/msdu/local/intel/mkl/include


#Intel_PATH = /opt/intel/mkl/lib/intel64
#Intel_Include = -I/opt/intel/mkl/include


Intel_Lib = -Wl,-R$(Intel_PATH)                 \
            -Wl,-rpath-link,$(Intel_PATH)       \
            -L$(Intel_PATH) -lmkl_intel_lp64    \
            -L$(Intel_PATH) -lmkl_gnu_thread    \
            -L$(Intel_PATH) -lmkl_core -fopenmp
 
 
blas_lib = $(Intel_Lib)  

 

 
makefile_inc_libs =      $(mumps_lib)  $(metis_lib)  $(scotch_lib) $(scalapack_lib) $(blas_lib)
makefile_inc_includes =  $(mumps_include)  $(metis_include) $(scotch_include)
 
 
 
 
 
