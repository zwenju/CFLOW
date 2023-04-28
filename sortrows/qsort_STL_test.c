/* Sat 08 Apr 2017 04:15:21 PM EDT  */
/* qsort locates in the stdlib.h */
/* void qsort (void* base, size_t num, size_t size, int (*compar)(const void*,const void*)); */

/* Parameters : */
/* base */
/*     Pointer to the first object of the array to be sorted, converted to a void*. */
/* num */
/*     Number of elements in the array pointed to by base. */
/*     size_t is an unsigned integral type. */
/* size */
/*     Size in bytes of each element in the array. */
/*     size_t is an unsigned integral type. */
/* compar */
/*     Pointer to a function that compares two elements. */
/*     This function is called repeatedly by qsort to compare two elements. It shall follow the following prototype: */
/*     int compar (const void* p1, const void* p2); */
/* ***************************************************************** */

/* Taking two pointers as arguments (both converted to const void*). The function defines the order of the elements by returning (in a stable and transitive manner): */
/* return value	meaning */
/* <0	The element pointed to by p1 goes before the element pointed to by p2 */
/* 0	The element pointed to by p1 is equivalent to the element pointed to by p2 */
/* >0	The element pointed to by p1 goes after the element pointed to by p2 */

/* For types that can be compared using regular relational operators, a general compar function may look like: */
	
/*int compareMyType (const void * a, const void * b) */
/*{   */
/*  if ( *(MyType*)a <  *(MyType*)b ) return -1;*/
/*  if ( *(MyType*)a == *(MyType*)b ) return 0; */
/*  if ( *(MyType*)a >  *(MyType*)b ) return 1; */
/*}  */


/* qsort example */
#include <stdio.h>      /* printf */
#include <stdlib.h>     /* qsort */

int values[] = { 40, 10, 100, 90, 20, 25 };

int compare (const void * a, const void * b)
{
  return ( *(int*)a - *(int*)b );
}

int main ()
{
  int n;
  qsort (values, 6, sizeof(int), compare);
  
    for (n=0; n<6; n++)
    {
    printf ("%d ",values[n]);
    }  

  return 0;
}
