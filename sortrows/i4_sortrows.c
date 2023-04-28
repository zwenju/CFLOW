#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sortrows.h"

/* typedef int (*__compar_d_fn_t) (const void *, const void *, void *);  */

/*extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
  __compar_d_fn_t __compar, void *__arg) */


/* example : [ a1, a2, a3, a4] */
/* nsize is 4 (1-index) instead of  3 (0-index)  */
 


int i4_compare_n(const void *p1, const void *p2, void *nsize)
{ 
  const int *a1 = p1, *a2 = p2;   
  int  i;	 

  for( i = 0; i < *(int*)nsize; i++ )
    {
      if (a1[i] > a2[i]) 
	{
	  return(1);
	} 
      else if (a1[i] < a2[i]) 
	{ 
	  return(-1);
	}
    }

  return(0);
}

// arg is the number of element per column. 
void i4_sortrows_(int *base, int *nmemb, int *nsize) 
{

//  i4_write_rows (base, nmemb, nsize);
  qsort_r(base, (*nmemb), (*nsize) * sizeof(base[0]), i4_compare_n, nsize);

//  i4_write_rows (base, nmemb, nsize);
}




//

void i4_unique_sortrows_(int *base, int *nmemb, int *nsize, int *unique_num)  
{

  qsort_r(base, (*nmemb), (*nsize) * sizeof(base[0]), i4_compare_n, nsize);
  i4_unique_rows_ (base, nmemb, nsize, unique_num); 
  i4_write_rows (base, nmemb, nsize);

}



