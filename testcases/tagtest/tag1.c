#include "grid/quadtree.h"
#include "run.h"
#include "fractions.h"
#include "tag.h"

#define LEVEL 10

scalar f[], m[];

double geom (double x, double y) {
  double C1 = sq(x - 0.2) + sq(y) - sq(0.1);
  double C2 = sq(x - 0.8) + sq(y) - sq(0.01);

  double C1C2 = min(C1, C2);
  return - C1C2;
}

int main()
{
  init_grid (256);
  run();
}

event inital(i = 0)
{
  f.refine = f.prolongation = fraction_refine;
  
  double iteration = 0;
  do {
    iteration++;
    fraction (f, geom(x,y));
  } while (adapt_wavelet({f}, (double []){0.005}, LEVEL, 5).nf != 0 && iteration <= 10);

  foreach()
  {
    m[] = f[] > 1.e-3;
  }

  fprintf(qerr,"%d",((int)iteration));
  int n = tag(m);

  output_ppm (m, file = "tag.ppm", min = 0, max = n);
  
  dump ("output");
}

