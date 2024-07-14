#include "grid/quadtree.h"
#include "run.h"
#include "tag.h"

scalar test[];

int main()
{
  size(8);
  origin(0,0);
  init_grid (32);
  run();
}

event inital(i = 0)
{
  foreach(){
    if(x >= 4 && y >= 4 && x <= 6 && y <= 6)
    {
      test[] = 1;
    }
    else
    {
      test[] = 0;
    }
  }

  int n = tag (test);

  adapt_wavelet({test}, (double []){0.05}, 4, 2);
  foreach() {
    if (test[] == 0)
      test[] = nodata;
    else
      fprintf (qerr, "%g %g %g\n", x, y, test[]);
  }

  output_ppm (test, file = "tag.ppm", min = 0, max = n);
  dump ("output");
}


