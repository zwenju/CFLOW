#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sortrows.h"



void  i4_unique_rows_ (int *base, int *nmemb, int *nsize, int *unique_num)
{

  int *pfirst = base;
  int *plast  = base;
  int i, icount;
  int flag;


  icount = 1;
  for( i = 1; i < (*nmemb); i++ )
    {
      plast = plast + (*nsize);
      flag = i4_compare_n (plast, pfirst, nsize);

      if(flag != 0 )
        {
          icount++;
          pfirst = pfirst + (*nsize);
          memcpy( pfirst, plast,  (*nsize) * sizeof (base[0]) );
        }

    }

  *unique_num = icount;

  pfirst = pfirst + (*nsize);
  memset( (int*) pfirst, 0, (*nmemb - *unique_num) * (*nsize) * sizeof(base[0]) );


}
