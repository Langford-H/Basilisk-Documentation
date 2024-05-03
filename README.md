# Basilisk Documentation
This is a Documentation for PDE solver (Basilisk)[http://basilisk.fr/] written by Haochen Huang, a master candidate in XJTU.\\

The doc is written for those who are interested in how things work inside Basilisk and want to alter the solver.

# Plan
## Those under construction or done 
-centered solver
	-centered.h
	-double-projection.h
		-viscosity.h
		-poisson.h
		-bcg.h

-VOF multiphase solver
	-two-phase.h
		-vof.h
			-fractions.h
	-iforce.h
		-curvature.h
			-heights.h
			-parabola.h

-solid embed boundary
	-embed.h and everything associated in other headfile
	-embed-tree.h


## Future maybe
-mesh associated
-compressible
-ast

# Contact
(My sandbox)[basilisk.fr/sandbox/HCH/README] and feel free to email me: dahuanghhc@gmail.com
