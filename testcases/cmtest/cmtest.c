#include "grid/quadtree.h"
#include "run.h"

scalar test[];

int main()
{
  size(4);
  origin(-2,-2);
  init_grid (16);
  run();
}

event inital(i = 0)
{
  foreach()
  {
    test[] = 1;
  }

  foreach_cell()
  {
    foreach_child() 
    {
      fprintf (stdout, "%g %g %g\n", x, y, cm[-child.x]);
    }
  }
}

event end(i = 10) {}
