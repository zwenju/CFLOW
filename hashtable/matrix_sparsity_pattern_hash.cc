#include <iostream>
#include <unordered_map>
#include "sortrows.h"
using namespace std;


extern "C" 
{  
 //
 // five step for hash map 
 //
 void matrix_hash_init_();
 void matrix_hash_insert_(int *dim_num, int *irow, int *jcol);
 void matrix_hash_size_(int *hash_size);
 void matrix_hash_to_coo_(int *dim_num, int *ia, int *ja);
 void matrix_hash_free_();
}

//
// set the matrix_hash_table as a global variable 
// this routine must be initilized before using   
// the preallocated memory all will be deleted   
//
std::unordered_map <int, int> matrix_hash_table;
int *COO_I_J;

//
// initilize the hash table 
// void matrix_hash_init()
//

void matrix_hash_init_()
{
  if ( matrix_hash_table.empty() != 0 ) 
    {
      matrix_hash_table.clear(); 
    }
}

//
// we all assume that the matrix is squared row size = column size  
// for the matrix, the hash function can be easily defined as <<key =  (irow-1)*dim_num + jcol>>  
// void matrix_hash_insert (int *dim_num, int *irow, int *jcol) 
//
void matrix_hash_insert_(int *dim_num, int *irow, int *jcol) 
{
  matrix_hash_table.insert ( { (*irow-1) * (*dim_num) + (*jcol), (*jcol) }  ); 
}

//
// the hash table  size  << returns the number of elements >>
// in other way, it is the non-zero number of the sparse matrix 
// void matrix_hash_size (int *hash_size) 
//
void matrix_hash_size_(int *hash_size) 
{
  *hash_size = matrix_hash_table.size(); 
}


//
// return Coordinate Format in row-oriented order
// void matrix_hash_to_coo (int *dim_num, int *ia, int *ja)
//
void matrix_hash_to_coo_(int *dim_num, int *ia, int *ja)
{
 unsigned long int i = 0;
  //
  // allocate the COO_I_J to order the sparse matrix in ordered-oriented (row/col)
  //
  COO_I_J = new int [2 * matrix_hash_table.size()]; 

  for (auto it = matrix_hash_table.begin(); it != matrix_hash_table.end(); ++it)
    {
 
      COO_I_J[i * 2    ] = (it->first - it->second) / (*dim_num) + 1;
      COO_I_J[i * 2 + 1] = it->second;
      i = i + 1; 
      //    cout << "ii =- " << i << "ia[i] = " << ia[i-1] << " ja[i] " << ja[i-1]  << endl; 
    }
   

  //
  // re-order the sparse matrix index  to make it row-oriented order  
  //

  int n_memb[1], n_size[1];
  n_memb[0] = matrix_hash_table.size();
  n_size[0] = 2; 

  //
  // order the matrix COO_I_J based in the row-orientation   
  //
  i4_sortrows_(COO_I_J, n_memb, n_size); 
  //i4_sortrows_reverse_(COO_I_J, n_memb, n_size); 
  //
  // here ia[], ja[] is preallocated outside this function 
  //
  for (i = 0; i < matrix_hash_table.size(); i++) 
    {
      ia [i] = COO_I_J[i * 2 ];
      ja [i] = COO_I_J[i * 2 + 1];
    }
}


//
// free the memory allocated during constructing the hashtable   
// void matrix_hash_free
//
void matrix_hash_free_()
{
  delete [] COO_I_J;
  matrix_hash_table.clear(); 
}







