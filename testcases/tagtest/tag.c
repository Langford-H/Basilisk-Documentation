#include "run.h"
#include "tag.h"

scalar test[];

int main()
{
  size(1);
  origin(-0.5,-0.5);
  init_grid (64);
  run();
}

event inital(i = 0)
{
  foreach(){
    test[] = sin(4*pi*x)*cos(4.*pi*y) > 0.5;
  }

  int n = tag (test);

  foreach() {
    if (test[] == 0)
      test[] = nodata;
    else
      fprintf (qerr, "%g %g %g\n", x, y, test[]);
  }
}

event end(i = 10) {}
