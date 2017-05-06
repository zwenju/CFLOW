#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sortrows.h"



void  i4_write_rows (int *base, int *nmemb, int *nsize) 
{
  int icol, jrow;
   
    printf("the matrix size is  [ %d x %d ] \n", *nmemb, *nsize ); 
  for ( icol = 0; icol < *nmemb; icol++ )
    {

      for ( jrow = 0; jrow < *nsize; jrow ++ )
	{
	  printf ( "%8d  ", base[ icol * (*nsize) + jrow ]  ) ; 

	}

      printf("\n");

    }

}



