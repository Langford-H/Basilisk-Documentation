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

Unlike most open-source solvers, which usually consist of a collection of header files designed for specific types of PDEs in Fortran, C, or C++, Basilisk features a [Domain Specific Language (DSL)](https://en.wikipedia.org/wiki/Domain-specific_language) called BasiliskC. For users familiar with Basilisk simulations, the installation process involves generating *qcc*, a [transpiler](https://en.wikipedia.org/wiki/Source-to-source_compiler#:~:text=A%20source%2Dto%2Dsource%20translator,or%20a%20different%20programming%20language.) (or preprocessor) provided by Basilisk that translates BasiliskC into standard C99 for compilation with *gcc*. This design ensures the versatility of Basilisk: as long as your machine has *gcc*, you can run Basilisk seamlessly. Additionally, a key component of Basilisk is its mesh management, which is deeply integrated with *qcc*. This allows for efficient iteration over multigrid and tree grid structures, freeing solver developers from tedious tasks like manual memory allocation and MPI compatibility, so they can focus on high-level solver development.

Based on our previous discussions, coherent documentation for Basilisk should include two main components. The first part consists of the header files, including the PDE solver (such as centered.h and [poisson.h](./poisson.h-doc/poisson_h_Documentation.pdf)), which represent the physical core of the overall solver. The second part encompasses the low-level components (the preprocessor and mesh configuration), which embody the spirit of Basilisk.


# Plan
## Header File
### Incompressible solver 
- [] centered solver
	- [] [centered.h](./centered.h-doc/centered_h_Documentation.pdf)
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

### Grid
- [] grid/tree.h
- [] grid/tree-common.h
- [] grid/mempool.h
- [] grid/memindex/range.h

## Compiler
- [] ast

# Contact
[My sandbox](basilisk.fr/sandbox/HCH/README) and feel free to email me: dahuanghhc@gmail.com
