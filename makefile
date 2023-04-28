all: 
	cd lib; rm *.o         ||:
	cd .. 
	+$(MAKE) -C  linalg  ||:
	+$(MAKE) -C  linalg install 
	+$(MAKE) -C  mesh 
	+$(MAKE) -C  mesh  install 
	+$(MAKE) -C  sortrows
	+$(MAKE) -C  sortrows install 
	+$(MAKE) -C  fem ||:
	+$(MAKE) -C  fem install  ||:
	+$(MAKE) -C  sparse_matrix ||:
	+$(MAKE) -C  sparse_matrix install  ||:
	+$(MAKE) -C  hashtable ||:
	+$(MAKE) -C  hashtable install ||: 
	+$(MAKE) -C  quadrature_rules ||:
	+$(MAKE) -C  quadrature_rules install ||: 
	cd lib;  make lib 








