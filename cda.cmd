it:=0;

c1 := { if ( it < 200 ) then 
  j 0.01*(1 - it/200); 
  g 10; 
  it := it + 10; 
  te := total_energy; 
  u 1; 
  V 10;
  g 10; 
  printf "# it %g, energy %g \n",it, te; 
  printf "%g %g \n",it, te>> "hist.txt";
}


showsc:=
{
asc:=avg(vertex,sqcurve);
msc:=max(vertex,sqcurve);
rsc:=msc/asc;
printf "asc=%g\nmsc=%g\nrate=%g\n",asc,msc,rsc;
}

fixspike:={asc:=avg(vertex,sqcurve);
foreach vertex vv where vv.sqcurve > 10*asc do {raw_vertex_average vv}5;
foreach vertex vv where vv.sqcurve > 5*asc do {raw_vertex_average vv}5;
V 10;
}

es:={foreach facet ff where ((ff.vertex[1].valence<5) or (ff.vertex[2].valence<5) or (ff.vertex[3].valence<5)) do {
foreach ff.edge ee where ((ee.vertex[1].valence>5) and (ee.vertex[2].valence>5)) do
{edgeswap ee}
}
}

c0:={
j 0.01;
g 10;
u;
V 10;
g 10;
asc:=avg(vertex,sqcurve);
msc:=max(vertex,sqcurve);
if msc > 2*asc then fixspike;
es 2;
V 10;
}

