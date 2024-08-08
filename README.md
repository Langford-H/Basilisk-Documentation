# Basilisk Documentation
This is a Documentation for PDE solver [Basilisk](http://basilisk.fr/) written by Haochen Huang, a master candidate in XJTU.

The doc is written for those who are interested in how things work inside Basilisk and want to alter the solver.

<figure>
  <br />
  <img src="readmeimage/layer.png" height="200">
  <figcaption>
  </figcaption>
  <br /> <br />
</figure>

# For Real What is [Basilisk](http://basilisk.fr/)?
**Technically, Basilisk consists of two parts.**

Unlike most of the opensourced solver which is indeed a group of header file that can solve a specific type of PDE written in Fortran/C/C++, Basilisk also provides a kind of programme language ( a compiler specifically ) named BasiliskC. For those who have experience of simulation with Basilisk, the [installation process](http://basilisk.fr/src/INSTALL) is the process generating *qcc*: the complier provided by Basilisk.

Therefore a coherent documentation for Basilisk should be twofolds. The first part is the header file, including the solver, the configuration of mesh etc. And the second part is the compiler as well as the design philosophy behind (in my limited personal perspective of course).  
# Plan
## Header File
### Incompressible solver 
- [] centered solver
	- [] centered.h
	- [] double-projection.h
		- [x] [viscosity.h](./viscosity.h-doc/viscosity_h_Documentation.pdf)
		- [x] [poisson.h](./poisson.h-doc/poisson_h_Documentation.pdf)
		- [x] [bcg.h](./bcg.h-doc/bcg_h_Documentation.pdf)

- [] VOF multiphase solver
	- [] two-phase-levelset.h
		- [] redistance.h
	- [] two-phase-clsvof.h
		- [] tracer.h
	- [] two-phase.h
		- [] two-phase-generic.h
		- [x] [vof.h](./vof.h-doc/vof_h_Documentation.pdf)
			- [] fractions.h
			- [] geometry.h
	- [] iforce.h
		- [] curvature.h
			- [] [heights.h](./heights.h-doc/heights_h_Documentation.pdf)
			- [] parabola.h

- [] solid embed boundary
	- [] embed.h and everything associated in other headfile
	- [] [embed-tree.h](./embed-tree.h-doc/embed_tree_h_Documentation.pdf)

<figure>
  <br />
  <img src="readmeimage/filetree.png" height="500">
  <figcaption>
  </figcaption>
  <br /> <br />
</figure>

### Compressible solver
- [] compressible

### Future maybe
- [] mesh associated

## Compiler
- [] ast

# Contact
[My sandbox](basilisk.fr/sandbox/HCH/README) and feel free to email me: dahuanghhc@gmail.com
