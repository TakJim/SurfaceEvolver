// q: Dump of structure.

// datafilename: cube.fe
vertices_predicted        15
edges_predicted           37
facets_predicted          25
facetedges_predicted      73
bodies_predicted           2
quantities_predicted            0
method_instances_predicted      0
// Total energy:  6
SOAPFILM

LINEAR

PARAMETER ideal_rad =  0 

VIEW_MATRIX 
 2.000000000000000   0.000000000000000   0.000000000000000  -1.000000000000000  
 0.000000000000000   2.000000000000000   0.000000000000000  -1.000000000000000  
 0.000000000000000   0.000000000000000   2.000000000000000  -1.000000000000000  
 0.000000000000000   0.000000000000000   0.000000000000000   1.000000000000000  
slice_coeff = { 1.00000, 0.00000, 0.00000, 0.50000}


vertices        /*  coordinates  */    
  1                  0                 0                 0
  2                  1                 0                 0
  3                  1                 1                 0
  4                  0                 1                 0
  5                  0                 0                 1
  6                  1                 0                 1
  7                  1                 1                 1
  8                  0                 1                 1
  9                0.5                 0               0.5
 10                  1               0.5               0.5
 11                0.5                 1               0.5
 12                  0               0.5               0.5
 13                0.5               0.5                 1
 14                0.5               0.5                 0

edges  
  1       1    2    
  2       2    3    
  3       3    4    
  4       4    1    
  5       5    6    
  6       6    7    
  7       7    8    
  8       8    5    
  9       1    5    
 10       2    6    
 11       3    7    
 12       4    8    
 13       1    9    
 14       2    9    
 15       6    9    
 16       5    9    
 17       2   10    
 18       3   10    
 19       7   10    
 20       6   10    
 21       3   11    
 22       4   11    
 23       8   11    
 24       7   11    
 25       4   12    
 26       1   12    
 27       5   12    
 28       8   12    
 29       5   13    
 30       6   13    
 31       7   13    
 32       8   13    
 33       1   14    
 34       4   14    
 35       3   14    
 36       2   14    

faces    /* edge loop */      
  1   -16 -9 13 /*area 0.25*/
  2   -20 -10 17 /*area 0.25*/
  3   -24 -11 21 /*area 0.25*/
  4   -28 -12 25 /*area 0.25*/
  5   -32 8 29 /*area 0.25*/
  6   -36 -1 33 /*area 0.25*/
  7   1 14 -13 /*area 0.25*/ original 1
  8   10 15 -14 /*area 0.25*/ original 1
  9   -5 16 -15 /*area 0.25*/ original 1
 10   2 18 -17 /*area 0.25*/ original 2
 11   11 19 -18 /*area 0.25*/ original 2
 12   -6 20 -19 /*area 0.25*/ original 2
 13   3 22 -21 /*area 0.25*/ original 3
 14   12 23 -22 /*area 0.25*/ original 3
 15   -7 24 -23 /*area 0.25*/ original 3
 16   4 26 -25 /*area 0.25*/ original 4
 17   9 27 -26 /*area 0.25*/ original 4
 18   -8 28 -27 /*area 0.25*/ original 4
 19   5 30 -29 /*area 0.25*/ original 5
 20   6 31 -30 /*area 0.25*/ original 5
 21   7 32 -31 /*area 0.25*/ original 5
 22   -4 34 -33 /*area 0.25*/ original 6
 23   -3 35 -34 /*area 0.25*/ original 6
 24   -2 36 -35 /*area 0.25*/ original 6

bodies  /* facets */
  1       1 2 3 4 5 6 7 8 9 10 \
           11 12 13 14 15 16 17 18 19 20 \
           21 22 23 24  volume 1  /*actual: 1*/ lagrange_multiplier 0  centerofmass 

read

metric_conversion off
autorecalc on
gv_binary off
gravity off


//Procedures and functions forward declarations:
gogo := {}
gogo2 := {}
// Procedures without arguments:
gogo := { g 5; 
  r; 
  g 5; 
  hessian; 
  r; 
  g 5; 
  hessian 
}
gogo2 := { g 5; 
  r; 
  g 5; 
  hessian; 
  r; 
  g 5; 
  hessian; 
  lagrange 2; 
  g 5; 
  hessian; 
  lagrange 4; 
  g 5; 
  hessian; 
  lagrange 6; 
  g 5; 
  hessian; 
  ideal_rad := (3*body[1].volume/4/pi)**0.333333333333333; 
  printf "Area error: %g\n",total_area - 12.5663706143592*(ideal_rad)^2; 
  printf "Vertex radius spread: %g\n", 
    max(vertices,sqrt((x - 0.5)^2 + (y - 0.5)^2 + (z - 0.5)^2)) - 
    min(vertices,sqrt((x - 0.5)^2 + (y - 0.5)^2 + (z - 0.5)^2))
}
