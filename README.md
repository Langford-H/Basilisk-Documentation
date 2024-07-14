# Basilisk Documentation
This is a Documentation for PDE solver [Basilisk](http://basilisk.fr/) written by Haochen Huang, a master candidate in XJTU.

The doc is written for those who are interested in how things work inside Basilisk and want to alter the solver.

# Plan
## Those under construction or done 
- [] centered solver
	- [] centered.h
	- [] double-projection.h
		- [x] [viscosity.h](./viscosity-headfile/viscosity_h_Documentation.pdf)
		- [x] [poisson.h](./poisson-headfile/poisson_h_Documentation.pdf)
		- [x] [bcg.h](./bcg-headfile/bcg_h_Documentation.pdf)

- [] VOF multiphase solver
	- [] two-phase-levelset.h
		- [] redistance.h
	- [] two-phase-clsvof.h
		- [] tracer.h
	- [] two-phase.h
		- [] two-phase-generic.h
		- [] [vof.h](./vof-headfile/vof_h_Documentation.pdf)
			- [] fractions.h
			- [] geometry.h
	- [] iforce.h
		- [] curvature.h
			- [] [heights.h](./heights-headfile/heights_h_Documentation.pdf)
			- [] parabola.h

- [] solid embed boundary
	- [] embed.h and everything associated in other headfile
	- [] embed-tree.h

![The documentation tree](./readmeimage/filetree.svg|width=100)

![Basilisk Construction](./readmeimage/layer.svg|width=100)

## Future maybe
- [] mesh associated
- [] compressible
- [] ast

# Contact
[My sandbox](basilisk.fr/sandbox/HCH/README) and feel free to email me: dahuanghhc@gmail.com
