#include "run.h"
#include "tag.h"

scalar test[];

int main()
{
  size(8);
  origin(0,0);
  init_grid (8);
  run();
}

event inital(i = 0)
{
  foreach(){
    if(x == y)
    {
      if(x <= 3)
      {
        test[] = 1;
      }
      else if(x >= 4)
      {
        test[] = 2;
      }
    }
    else
    {
      test[] = 0;
    }
  }

  int n = tag (test);

  foreach() {
    if (test[] == 0)
      test[] = nodata;
    else
      fprintf (qerr, "%g %g %g\n", x, y, test[]);
  }

  output_ppm (test, file = "tag.ppm", min = 0, max = n);
  dump ("output");
}

