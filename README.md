# MultiAtomLiouvilleEquationGenerator
## Abstract
***
MulAtoLEG (Multi-Atom Liouville Equation Generator)
is an open-source Mathematica package for generating
Liouville superoperators and Liouville equations, specialized
for multilevel atomic systems comprising an arbitrary number of atoms.
This scheme is based on an extension to multilevel atomic systems,
originally developed by Lehmberg
[R. H. Lehmberg, Phys. Rev. A 2, 883 (1970)]
as an adjoint master equation
for ensembles of two-level emitters
and later reformulated by Genes
[M. Reitz, C. Sommer and C. Genes, PRX Quantum 3, 010201 (2022)]
as a master equation.
The package facilitates the generation of equations for complex
transition configurations in alkali atoms.
Although primarily designed for atomic systems, it can also generate
the master and adjoint master equations for general Hamiltonians
and Lindbladians. In addition, it includes functionalities to construct
the differential equations in the dressed-state basis, where, in many cases,
the non-unitary evolution operator can be determined explicitly.
To maximize computational efficiency, the package leverages Mathematica's
vectorization and sparse linear algebra capabilities.
Since MulAtoLEG produces exact equations without approximations,
the feasible system size is naturally limited by the available
computational resources.
***

## Installation
Download the **MulAtoLEG**
package ,`MultiAtomLiouvilleEquationGenerator.nb`,
and place it in a directory of your choice.
Download the **Reference Guide**,
`ReferenceGuideMultiAtomLiouvilleEquationGenerator.nb`,
which contains a complete list of commands,
detailed documentation, and illustrative examples.
