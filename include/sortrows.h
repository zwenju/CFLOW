#ifndef _SORTROWS_H_
#define _SORTROWS_H_

//#ifndef __USE_GNU 
//#define __USE_GNU
//#endif 


#include <stdio.h>
#include <stdlib.h>
#include <string.h>


#ifdef __cplusplus
extern "C"
{  
#endif 

void i4_write_rows (int *base, int *nmemb, int *nsize);

int  i4_compare_n(const void *p1, const void *p2, void *nsize);
void i4_sortrows_(int *base, int *nmemb,  int *nsize);
void i4_unique_sortrows_(int *base, int *nmemb,  int *nsize, int *unique_num);  


int  i4_compare_reverse_n(const void *p1, const void *p2, void *nsize);
void i4_sortrows_reverse_ (int *base, int *nmemb,  int *nsize); 
void i4_unique_sortrows_reverse_(int *base, int *nmemb,  int *nsize, int *unique_num);


#ifdef __cplusplus
}
#endif 


#endif 

