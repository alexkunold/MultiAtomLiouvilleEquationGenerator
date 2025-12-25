(* ::Package:: *)

BeginPackage["MultiAtomLiouvilleEquationGenerator`"];


MultiAtomBasis::usage = "MultiAtomBasis[nl, na] : nl, na \[Element] Integers
Returns a SparseArray containing a multi atom basis for na atoms with nl quantum levels each."


Sigma::usage = "Sigma[tr,\[Alpha], nl, na] : tr={\!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\),\!\(\*FormBox[SubscriptBox[\(tr\), \(2\)],
TraditionalForm]\)}; \!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(2\)], \\\ \[Alpha], \\\ na, \\\ \(\(nl\)\(\\\ \)\(\[Element]\)\)\),
TraditionalForm]\) Ingeters
Returns a SparseArray with the jump operator \[VerticalSeparator]\!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(1\)]\(\[RightAngleBracket]\)\),
TraditionalForm]\)\[LeftAngleBracket]\!\(\*FormBox[SubscriptBox[\(tr\), \(2\)],
TraditionalForm]\)\[VerticalSeparator] between states \[VerticalSeparator]\!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\)\!\(\*FormBox[\(\[RightAngleBracket]\),
TraditionalForm]\) and \[VerticalSeparator]\!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(2\)]\(\[RightAngleBracket]\)\),
TraditionalForm]\) for the \[Alpha]-th atom of a system consisting of na atoms with nl quantum levels."

SigmaT::usage = "SigmaT[tr,\[Alpha], nl, na] : tr={\!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\),\!\(\*FormBox[SubscriptBox[\(tr\), \(2\)],
TraditionalForm]\)}; \!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(2\)], \\\ \[Alpha], \\\ na, \\\ \(\(nl\)\(\\\ \)\(\[Element]\)\)\),
TraditionalForm]\) Ingeters
Returns a SparseArray with the adjoint jump operator \[VerticalSeparator]\!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(2\)]\(\[RightAngleBracket]\)\),
TraditionalForm]\)\[LeftAngleBracket]\!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\)\[VerticalSeparator] between states \[VerticalSeparator]\!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\)\!\(\*FormBox[\(\[RightAngleBracket]\),
TraditionalForm]\) and \[VerticalSeparator]\!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(2\)]\(\[RightAngleBracket]\)\),
TraditionalForm]\) for the \[Alpha]-th atom of a system consisting of na atoms with nl quantum levels."

Sigmaz::usage = "Sigmaz[tr,\[Alpha], nl, na] : tr={\!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\),\!\(\*FormBox[SubscriptBox[\(tr\), \(2\)],
TraditionalForm]\)}; \!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(2\)], \\\ \[Alpha], \\\ na, \\\ \(\(nl\)\(\\\ \)\(\[Element]\)\)\),
TraditionalForm]\) Ingeters
Returns a SparseArray with the \!\(\*FormBox[\(Pauli\\\ \*SubscriptBox[\(\[Sigma]\), \(z\)] - like\),
TraditionalForm]\) operator \[VerticalSeparator]\!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(1\)]\(\[RightAngleBracket]\)\),
TraditionalForm]\)\[LeftAngleBracket]\!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\)\[VerticalSeparator] - \[VerticalSeparator]\!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(2\)]\(\[RightAngleBracket]\)\),
TraditionalForm]\)\[LeftAngleBracket]\!\(\*FormBox[SubscriptBox[\(tr\), \(2\)],
TraditionalForm]\)\[VerticalSeparator] of states \[VerticalSeparator]\!\(\*FormBox[SubscriptBox[\(tr\), \(1\)],
TraditionalForm]\)\!\(\*FormBox[\(\[RightAngleBracket]\),
TraditionalForm]\) and \[VerticalSeparator]\!\(\*FormBox[\(\*SubscriptBox[\(tr\), \(2\)]\(\[RightAngleBracket]\)\),
TraditionalForm]\) for the \[Alpha]-th atom of a system consisting of na atoms with nl quantum levels."


Ham::usage = "Ham[transCE, transdd, nl,  na, t] : transCE, trasdd \[Element] List;  na, nl \[Element] Ingeters, t is a Mathematica symbol that represents the time variable
Returns a SparseArray for the time-dependent Hamiltonian in the interaction picture that accounts for light-matter and dipole-dipole interactions. The variable  transCE = {{{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(1, 1\)], \\\ \*SubscriptBox[\(ql\), \(1, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\*SubscriptBox[\(\[Alpha]\), \(1\)], \\\ \*SubscriptBox[\(Rb\), \(1\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(1\)], \\\ \*SubscriptBox[\(\[Phi]\), \(1\)]\),
TraditionalForm]\)}, {{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(2, 1\)], \\\ \*SubscriptBox[\(ql\), \(2, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\(\\\ \)\(\*SubscriptBox[\(\[Alpha]\), \(2\)], \\\ \*SubscriptBox[\(Rb\), \(2\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(2\)], \\\ \*SubscriptBox[\(\[Phi]\), \(2\)]\)\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the light-matter interaction of the \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th atom. These parameters are: the two quantum levels excited by the laser \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1\)],
TraditionalForm]\)and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2\)],
TraditionalForm]\), the Rabi parameter \!\(\*FormBox[SubscriptBox[\(Rb\), \(k\)],
TraditionalForm]\), the detuning  \!\(\*FormBox[SubscriptBox[\(\[CapitalDelta]\), \(k\)],
TraditionalForm]\) and the phase \!\(\*FormBox[SubscriptBox[\(\[Phi]\), \(k\)],
TraditionalForm]\).  The variable transdd={{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(2\)],
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions corresponding to the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms (\!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)\[NotEqual]\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Beta]\), \(k\)]\),
TraditionalForm]\)). The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[CapitalOmega]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. For \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) to be significant, it must be much smaller than both energy transitions themselves. Usually \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0. transCE and transdd might be empty lists in case there are no light-matter interactions or/and there are no dipole-dipole interactions."

HamDressed::usage = "HamDressed[transCE, transdd, nl,  na] : transCE, trasdd \[Element] List;  na, nl \[Element] Ingeters
Returns a SparseArray for the time-independent Hamiltonian in the dressed state base that accounts for light-matter and dipole-dipole interactions. The variable  transCE = {{{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(1, 1\)], \\\ \*SubscriptBox[\(ql\), \(1, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\*SubscriptBox[\(\[Alpha]\), \(1\)], \\\ \*SubscriptBox[\(Rb\), \(1\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(1\)], \\\ \*SubscriptBox[\(\[Phi]\), \(1\)]\),
TraditionalForm]\)}, {{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(2, 1\)], \\\ \*SubscriptBox[\(ql\), \(2, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\(\\\ \)\(\*SubscriptBox[\(\[Alpha]\), \(2\)], \\\ \*SubscriptBox[\(Rb\), \(2\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(2\)], \\\ \*SubscriptBox[\(\[Phi]\), \(2\)]\)\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the light-matter interaction of the \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th atom. These parameters are: the two quantum levels excited by the laser \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1\)],
TraditionalForm]\)and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2\)],
TraditionalForm]\), the Rabi parameter \!\(\*FormBox[SubscriptBox[\(Rb\), \(k\)],
TraditionalForm]\), the detuning  \!\(\*FormBox[SubscriptBox[\(\[CapitalDelta]\), \(k\)],
TraditionalForm]\) and the phase \!\(\*FormBox[SubscriptBox[\(\[Phi]\), \(k\)],
TraditionalForm]\).  The variable transdd={{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(2\)],
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions corresponding to the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms (\!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)\[NotEqual]\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Beta]\), \(k\)]\),
TraditionalForm]\)). The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[CapitalOmega]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. For HamDressed these parameters must be \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0, otherwise the Hamiltonian becomes time-dependent. transCE and transdd might be empty lists in case there are no light-matter interactions or/and there are no dipole-dipole interactions."

RotatingFrameParms::usage = "RotatingFrameParms[transCE] : transCE \[Element] List
Returns a List of the rotation parameters {\!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(2\)],
TraditionalForm]\), \[Ellipsis]\!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(n\)],
TraditionalForm]\) }, where n=Length[transCE], necessary to transform the time-dependent Hamiltonian Ham into the time-independent HamDressed by switching to a rotating frame. The variable  transCE = {{{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(1, 1\)], \\\ \*SubscriptBox[\(ql\), \(1, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\*SubscriptBox[\(\[Alpha]\), \(1\)], \\\ \*SubscriptBox[\(Rb\), \(1\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(1\)], \\\ \*SubscriptBox[\(\[Phi]\), \(1\)]\),
TraditionalForm]\)}, {{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(2, 1\)], \\\ \*SubscriptBox[\(ql\), \(2, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\(\\\ \)\(\*SubscriptBox[\(\[Alpha]\), \(2\)], \\\ \*SubscriptBox[\(Rb\), \(2\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(2\)], \\\ \*SubscriptBox[\(\[Phi]\), \(2\)]\)\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the light-matter interaction of the \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th atom. These parameters are: the two quantum levels excited by the laser \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1\)],
TraditionalForm]\)and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2\)],
TraditionalForm]\), the Rabi parameter \!\(\*FormBox[SubscriptBox[\(Rb\), \(k\)],
TraditionalForm]\), the detuning  \!\(\*FormBox[SubscriptBox[\(\[CapitalDelta]\), \(k\)],
TraditionalForm]\) and the phase \!\(\*FormBox[SubscriptBox[\(\[Phi]\), \(k\)],
TraditionalForm]\). The dressed Hamiltonian (HamDressed) is obtained from the time-dependent Hamiltonian (Ham) as \!\(\*FormBox[SubscriptBox[\(H\), \(D\)],
TraditionalForm]\)=\!\(\*FormBox[SubscriptBox[\(U\), \(1\)],
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(U\), \(2\)],
TraditionalForm]\)\[Ellipsis]\!\(\*FormBox[SubscriptBox[\(U\), \(n\)],
TraditionalForm]\)H\!\(\*FormBox[SubsuperscriptBox[\(U\), \(n\), \(\[Dagger]\)],
TraditionalForm]\)\[Ellipsis]\!\(\*FormBox[SubsuperscriptBox[\(U\), \(2\), \(\[Dagger]\)],
TraditionalForm]\)\!\(\*FormBox[SubsuperscriptBox[\(U\), \(1\), \(\[Dagger]\)],
TraditionalForm]\) where H is the Hamiltonian given by Ham, \!\(\*FormBox[SubscriptBox[\(H\), \(D\)],
TraditionalForm]\) is the Hamiltonian given by HamDressed, \!\(\*FormBox[SubscriptBox[\(U\), \(k\)],
TraditionalForm]\)=MatrixExp[-\[ImaginaryI] t \!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(k\)],
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Sigma]\), \(z, k\)],
TraditionalForm]\)] and \!\(\*FormBox[SubscriptBox[\(\[Sigma]\), \(z, k\)],
TraditionalForm]\) = Sigmaz[transCE[[k,1]], \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\), nl, na]. nl and na are the numbers of quantum states and atoms, respectively."

RotatingFrameTrans::usage = "RotatingFrameTrans[transCE, nl, na, t] : transCE \[Element] List, nl, na \[Element] Integers, t is a Mathematica symbol that represents the time variable
RotatingFrameTrans[h, transCE, nl, na, t] : h \[Element] SparseArray, transCE \[Element] List, nl, na \[Element] Integers, t is a Mathematica symbol that represents the time variable
If the basis h is not provided, th function returns a List of two SparseArray objects:{\!\(\*FormBox[SubscriptBox[\(U\), \(R\)],
TraditionalForm]\), \!\(\*FormBox[SubsuperscriptBox[\(U\), \(R\), \(\[Dagger]\)],
TraditionalForm]\)}, where \!\(\*FormBox[SubscriptBox[\(U\), \(R\)],
TraditionalForm]\) is the transformation that removes the time dependence from the time-dependent Hamiltonian Ham by switching to a rotating frame. The transformation \!\(\*FormBox[SubscriptBox[\(U\), \(R\)],
TraditionalForm]\)  is composed of the n=Length[transCE] rotations, each arising  from  the parameters \[Mu] = {\[InvisibleComma]\!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(2\)],
TraditionalForm]\), \[Ellipsis], \!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(n\)],
TraditionalForm]\)} produced by RotatingFrameParms. Thus, \!\(\*FormBox[SubscriptBox[\(U\), \(R\)],
TraditionalForm]\)=\!\(\*FormBox[SubscriptBox[\(U\), \(1\)],
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(U\), \(2\)],
TraditionalForm]\)\[Ellipsis]\!\(\*FormBox[SubscriptBox[\(U\), \(n\)],
TraditionalForm]\) where each \!\(\*FormBox[SubscriptBox[\(U\), \(k\)],
TraditionalForm]\)=MatrixExp[-\[ImaginaryI] t \!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(k\)],
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Sigma]\), \(z, k\)],
TraditionalForm]\)],  with \!\(\*FormBox[SubscriptBox[\(\[Mu]\), \(k\)],
TraditionalForm]\)=\[Mu][[k]], and \!\(\*FormBox[SubscriptBox[\(\[Sigma]\), \(z, k\)],
TraditionalForm]\) = Sigmaz[transCE[[k,1]], \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\), nl, na]. If the basis h is given, RotatingFramTrans returns a List of four SparseArray objects  {\!\(\*FormBox[SubscriptBox[\(U\), \(R\)],
TraditionalForm]\), \!\(\*FormBox[SubsuperscriptBox[\(U\), \(R\), \(\[Dagger]\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(L\), \(R\)],
TraditionalForm]\), \!\(\*FormBox[SubsuperscriptBox[\(L\), \(R\), \(\[Dagger]\)],
TraditionalForm]\)} where \!\(\*FormBox[SubscriptBox[\(L\), \(R\)],
TraditionalForm]\) and \!\(\*FormBox[SubsuperscriptBox[\(L\), \(R\), \(\[Dagger]\)],
TraditionalForm]\) are the superoperators corresponding to the linear maps \!\(\*FormBox[SubscriptBox[\(L\), \(R\)],
TraditionalForm]\)\[Rho] =\!\(\*FormBox[SubscriptBox[\(U\), \(R\)],
TraditionalForm]\)\[Rho]\!\(\*FormBox[\(\(\\\ \)\*SubsuperscriptBox[\(U\), \(R\), \(\[Dagger]\)]\),
TraditionalForm]\) and   \!\(\*FormBox[SubsuperscriptBox[\(L\), \(R\), \(\[Dagger]\)],
TraditionalForm]\)\[Rho] =\!\(\*FormBox[SubsuperscriptBox[\(U\), \(R\), \(\[Dagger]\)],
TraditionalForm]\)\[Rho] \!\(\*FormBox[SubscriptBox[\(U\), \(R\)],
TraditionalForm]\). These superoperators are useful for transforming other superoperators into and out of the rotating frame. The variable transCE is structured as transCE = {{{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(1, 1\)], \\\ \*SubscriptBox[\(ql\), \(1, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\*SubscriptBox[\(\[Alpha]\), \(1\)], \\\ \*SubscriptBox[\(Rb\), \(1\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(1\)], \\\ \*SubscriptBox[\(\[Phi]\), \(1\)]\),
TraditionalForm]\)}, {{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(2, 1\)], \\\ \*SubscriptBox[\(ql\), \(2, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\(\\\ \)\(\*SubscriptBox[\(\[Alpha]\), \(2\)], \\\ \*SubscriptBox[\(Rb\), \(2\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(2\)], \\\ \*SubscriptBox[\(\[Phi]\), \(2\)]\)\),
TraditionalForm]\)}, \[Ellipsis]}. This list contains the parameters for the light-matter interaction of the \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th atom. These parameters are: the two quantum levels excited by the laser \!\(\*FormBox[\((\*SubscriptBox[\(ql\), \(k, 1\)]\),
TraditionalForm]\)and \!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(k, 2\)]\()\)\),
TraditionalForm]\), the Rabi frequency \!\(\*FormBox[SubscriptBox[\(Rb\), \(k\)],
TraditionalForm]\), the detuning  \!\(\*FormBox[SubscriptBox[\(\[CapitalDelta]\), \(k\)],
TraditionalForm]\) and the phase \!\(\*FormBox[SubscriptBox[\(\[Phi]\), \(k\)],
TraditionalForm]\)."



LiouvilleLindbladian::usage = "LiouvilleLindbladian[h, transLi, nl, na] : h \[Element] SparseArray, transLi \[Element] List, nl, na \[Element] Integers
LiouvilleLindbladian[h, transLi, nl, na, t] : h \[Element] SparseArray, transLi \[Element] List, nl, na \[Element] Integers, t is a Mathematica symbol that represents the time variable
Returns a SparseArray of dimension  Length[h] that contains the Liouville superoperator corresponding to the Lindbladian of the master equation.  na and nl are the numbers of atoms and quantum levels of the system. h is the SparseArray that contains the matrix basis generated with MultiAtomBasis.The variable transLi = {{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Delta]\), \(2\)]\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)) of the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms. The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[Gamma]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. These usually vanish, i.e. \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0. In this case, the time variable t can be omitted as an argument of LiouvilleLindbladian."

LiouvilleLindbladianDagger::usage = "LiouvilleLindbladianDagger[h, transLi, nl, na] : h \[Element] SparseArray, transLi \[Element] List, nl, na \[Element] Integers
LiouvilleLindbladianDagger[h, transLi, nl, na, t] : h \[Element] SparseArray, transLi \[Element] List, nl, na \[Element] Integers, t is a Mathematica symbol that represents the time variable
Returns a SparseArray of dimension  Length[h] that contains the adjoint Liouville superoperator corresponding to the adjoint Lindbladian of the adjoint master equation.  na and nl are the numbers of atoms and quantum levels of the system. h is the SparseArray that contains the matrix basis generated with MultiAtomBasis.The variable transLi = {{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Delta]\), \(2\)]\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)) of the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms. The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[Gamma]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. These usually vanish, i.e. \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0. In this case, the time variable t can be omitted as an argument of LiouvilleLindbladianDagger."



LiouvilleCommutator::usage = "LiouvilleCommutator[h, H] : h, H \[Element] SparseArray
Returns a SparseArray of dimension Length[h] that contains the Liouville superoperator corresponding to the commutator i[H, \[Rho]] of the  master equation or to the commutator i[H, Q] of the adjoint master equation. It is important to notice that in the case of the master equation it is important to set the sign of the Liouville superoperator to negative. In contrast, in the adjoint master equation, this adjustment is not necessary."



LiouvilleMasterEquation::usage = "LiouvilleMasterEquation[q, Li, t] : q, Li \[Element] SparseArray,  t is a Mathematica symbol that represents the time variable
Returns a List of dimension  Length[q] = Length[Li] that contains the Liouville differential equations that correspond to the Liouville superoperator Li which includes both the Lindbladian and Hamiltonian parts generated using LiouvilleCommutator and LiouvilleLindbladian. The variable q should be a list of the density matrix coefficients, i.e., Tr[h \[Rho](t)] ."

LiouvilleAdjointMasterEquation::usage = "LiouvilleAdjointMasterEquation[q, Lit, t] : q, Lit \[Element] SparseArray,  t is a Mathematica symbol that represents the time variable
Returns a List of dimension  Length[q] = Length[Li] that contains the Liouville differential equations that correspond to the adjoint Liouville superoperator Lit which includes both the adjoint Lindbladian and Hamiltonian parts generated using LiouvilleCommutator and LiouvilleLindbladianDagger. The variable q should represent either Tr[h(t) \[Rho](0)] or the expectation value \[LeftAngleBracket]\!\(\*FormBox[SubscriptBox[\(\[Psi]\), \(0\)],
TraditionalForm]\)\[VerticalSeparator]h(t)\[VerticalSeparator]\!\(\*FormBox[SubscriptBox[\(\[Psi]\), \(0\)],
TraditionalForm]\)\[RightAngleBracket], where \[Rho](0) and \[VerticalSeparator]\!\(\*FormBox[SubscriptBox[\(\[Psi]\), \(0\)],
TraditionalForm]\)\[RightAngleBracket] denote the initial density matrix and the initial pure state of the system, respectively. The operators h(t) are the Heisemberg picture evolution of the  basis operators h, generated using MultiAtomBasis."


MasterEquation::usage = "MasterEquation[h, q, q0, transCE, transdd, transLi, nl, na, t] : h, q, q0 \[Element] SparseArray, transCE, trasdd, transLi \[Element] List;  na, nl \[Element] Ingeters, t is a Mathematica symbol that represents the time variable
Returns a List of dimension Length[q] that contains the Liouville differential equations that correspond to the Liouville superoperator including both the Hamiltonian and  Lindbladian parts generated using LiouvilleCommutator and LiouvilleLindbladian. MasterEquation is a wrapper of LiouvilleMasterEquation. h is the SparseArray that contains the matrix basis generated with MultiAtomBasis. The variable q should be a list of the density matrix coefficients, i.e., q = Tr[h \[Rho](t)] . The initial conditions are set through q0=\[Rho](0). The configuration variable  transCE = {{{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(1, 1\)], \\\ \*SubscriptBox[\(ql\), \(1, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\*SubscriptBox[\(\[Alpha]\), \(1\)], \\\ \*SubscriptBox[\(Rb\), \(1\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(1\)], \\\ \*SubscriptBox[\(\[Phi]\), \(1\)]\),
TraditionalForm]\)}, {{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(2, 1\)], \\\ \*SubscriptBox[\(ql\), \(2, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\(\\\ \)\(\*SubscriptBox[\(\[Alpha]\), \(2\)], \\\ \*SubscriptBox[\(Rb\), \(2\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(2\)], \\\ \*SubscriptBox[\(\[Phi]\), \(2\)]\)\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the light-matter interaction of the \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th atom. These parameters are: the two quantum levels excited by the laser \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1\)],
TraditionalForm]\)and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2\)],
TraditionalForm]\), the Rabi parameter \!\(\*FormBox[SubscriptBox[\(Rb\), \(k\)],
TraditionalForm]\), the detuning  \!\(\*FormBox[SubscriptBox[\(\[CapitalDelta]\), \(k\)],
TraditionalForm]\) and the phase \!\(\*FormBox[SubscriptBox[\(\[Phi]\), \(k\)],
TraditionalForm]\).  The configuration variable transdd={{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(2\)],
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions corresponding to the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms (\!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)\[NotEqual]\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Beta]\), \(k\)]\),
TraditionalForm]\)). The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[CapitalOmega]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. For \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) to be significant, it must be much smaller than both energy transitions themselves. Usually \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0. transCE and transdd might be empty lists in case there are no light-matter interactions or/and there are no dipole-dipole interactions. The configuration variable transLi = {{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Delta]\), \(2\)]\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)) of the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms. The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[Gamma]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. These usually vanish, i.e. \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0."

AdjointMasterEquation::usage = "AdjointMasterEquation[h, q, q0, transCE, transdd, transLi, nl, na, t] : h, q, q0 \[Element] SparseArray, transCE, trasdd, transLi \[Element] List;  na, nl \[Element] Ingeters, t is a Mathematica symbol that represents the time variable
Returns a List of dimension Length[q] that contains the Liouville differential equations that correspond to the adjoint Liouville superoperator including both the Hamiltonian and  Lindbladian parts generated using LiouvilleCommutator and LiouvilleLindbladianDagger. AdjointMasterEquation is a wrapper of LiouvilleAdjointMasterEquation. h is the SparseArray that contains the matrix basis generated with MultiAtomBasis. The variable q should be a list of the density matrix coefficients, i.e., q = Tr[h \[Rho](t)]. In the case of the adjoint master equation, these coefficients can be interpreted as the basis matrices in the Heisenberg picture. The initial conditions are set through q0=\[Rho](0). The configuration variable  transCE = {{{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(1, 1\)], \\\ \*SubscriptBox[\(ql\), \(1, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\*SubscriptBox[\(\[Alpha]\), \(1\)], \\\ \*SubscriptBox[\(Rb\), \(1\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(1\)], \\\ \*SubscriptBox[\(\[Phi]\), \(1\)]\),
TraditionalForm]\)}, {{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(2, 1\)], \\\ \*SubscriptBox[\(ql\), \(2, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\(\\\ \)\(\*SubscriptBox[\(\[Alpha]\), \(2\)], \\\ \*SubscriptBox[\(Rb\), \(2\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(2\)], \\\ \*SubscriptBox[\(\[Phi]\), \(2\)]\)\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the light-matter interaction of the \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th atom. These parameters are: the two quantum levels excited by the laser \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1\)],
TraditionalForm]\)and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2\)],
TraditionalForm]\), the Rabi parameter \!\(\*FormBox[SubscriptBox[\(Rb\), \(k\)],
TraditionalForm]\), the detuning  \!\(\*FormBox[SubscriptBox[\(\[CapitalDelta]\), \(k\)],
TraditionalForm]\) and the phase \!\(\*FormBox[SubscriptBox[\(\[Phi]\), \(k\)],
TraditionalForm]\).  The configuration variable transdd={{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(2\)],
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions corresponding to the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms (\!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)\[NotEqual]\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Beta]\), \(k\)]\),
TraditionalForm]\)). The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[CapitalOmega]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. For \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) to be significant, it must be much smaller than both energy transitions themselves. Usually \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0. transCE and transdd might be empty lists in case there are no light-matter interactions or/and there are no dipole-dipole interactions. The configuration variable transLi = {{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Delta]\), \(2\)]\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)) of the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms. The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[Gamma]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. These usually vanish, i.e. \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0."


CleanUp::usage = "CleanUp[Op] : Op \[Element] SparseArray
Returns a SparseArray of dimension  Length[Op] with a cleaner set of ArrayRules. For example, in some cases it might eliminate vanishing imaginary elements."


Proj::usage = "Proj[h, Op]: h, Op \[Element] SparseArray
Returns a SparseArray of dimension Length[h] = Length[Op] that contains the expansion coefficients \!\(\*FormBox[SubscriptBox[\(Op\), \(i\)],
TraditionalForm]\) of the operator Op given by \!\(\*FormBox[SubscriptBox[\(Op\), \(i\)],
TraditionalForm]\) = Tr[\!\(\*FormBox[\(\(\*SubscriptBox[\(h\), \(i\)] Op\)\(]\)\),
TraditionalForm]\)."

ExpectationValue::usage = "ExpectationValue[h, q, Op]: h, q, Op \[Element] SparseArray
Returns an expression for the expectation value \!\(\*FormBox[UnderscriptBox[\(\[Sum]\), \(i\)],
TraditionalForm]\)Tr[\!\(\*FormBox[SubscriptBox[\(h\), \(i\)],
TraditionalForm]\) Op]\!\(\*FormBox[SubscriptBox[\(q\), \(i\)],
TraditionalForm]\) of the operator Op where \!\(\*FormBox[SubscriptBox[\(q\), \(i\)],
TraditionalForm]\) =Tr[\!\(\*FormBox[SubscriptBox[\(h\), \(i\)],
TraditionalForm]\)\[Rho]] are the density matrix coefficients and h is the matrix basis."


InitialConditions::usage = "Returns a List of dimension Length[h]=Length[q] with the initial conditions for the density matrix coefficients of the form {\!\(\*FormBox[\(\(\*SubscriptBox[\(q\), \(1\)]\)[0] == Tr[\*SubscriptBox[\(h\), \(1\)] . q0]\),
TraditionalForm]\), \!\(\*FormBox[\(\(\*SubscriptBox[\(q\), \(2\)]\)[0] == Tr[\*SubscriptBox[\(h\), \(2\)] . q0]\),
TraditionalForm]\), ...}.  h is the SparseArray that contains the matrix basis generated with MultiAtomBasis. The variable q should be a list of the density matrix coefficients, i.e., q = Tr[h \[Rho](t)] . The initial conditions are stored in a SparseArray  q0=\[Rho](0) of dimensions \!\(\*FormBox[SqrtBox[\(Length[q]\)],
TraditionalForm]\)\[Times]\!\(\*FormBox[SqrtBox[\(Length[q]\)],
TraditionalForm]\)=\!\(\*FormBox[SqrtBox[\(Length[h]\)],
TraditionalForm]\)\[Times]\!\(\*FormBox[SqrtBox[\(Length[h]\)],
TraditionalForm]\). "


FilteredClebschGordan::usage = "FilteredClebschGordan[{\!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(j\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(2\)],
TraditionalForm]\)}, {j, m}] :\!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(j\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(2\)],
TraditionalForm]\), j, m \[Element] Integers
Returns the Clebsch-Gordan coefficients \[LeftAngleBracket]\!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(1\)],
TraditionalForm]\); \!\(\*FormBox[SubscriptBox[\(j\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(2\)],
TraditionalForm]\) \[VerticalSeparator] j, m \[RightAngleBracket] as given by GlebschGordan[{j1, m1}, {j2, m2}, {j, m}], provided that the triangular condition \[VerticalSeparator]\!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\)- \!\(\*FormBox[SubscriptBox[\(j\), \(2\)],
TraditionalForm]\)\[VerticalSeparator] \[LessEqual] j \[LessEqual] \!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\)+ \!\(\*FormBox[SubscriptBox[\(j\), \(2\)],
TraditionalForm]\), and the magnetic quantum number condition \!\(\*FormBox[SubscriptBox[\(m\), \(1\)],
TraditionalForm]\)+ \!\(\*FormBox[SubscriptBox[\(m\), \(2\)],
TraditionalForm]\)= m are satisfied. Otherwise, it returns zero."

DipoleMatrixElement::usage = "DipoleMatrixElement[i, jp, j, fp, f, mfp, mf ] i, jp, j, fp, f, mfp, mf \[Element] Integers
Returns the angular part of dipole matrix element \[LeftAngleBracket]i, jp, fp, mfp\[VerticalSeparator] \!\(\*
StyleBox[\"p\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)\[VerticalSeparator] i, j, f, mf \[RightAngleBracket] leaving out the reduced matrix element. This separation follows the Wigner\[Dash]Eckart theorem, in which a matrix element is expressed as the product of a reduced matrix element (independent of magnetic quantum numbers) and a Clebsch\[Dash]Gordan coefficient or 3j-symbol that carries the angular dependence. i and j are the nuclear and electronic angular momentum quantum numbers, respectively, while f and mf denote the hyperfine total angular momentum and its magnetic quantum number, respectively."


LiouvilleLindbladianFromLindbladOperators::usage = "LiouvilleLindbladianFromLindbladOperators[h, liops, gammas]: h, liops, gammas \[Element] SparseArray
Returns a SparseArray of dimension Length[h]\[Times]Length[h] containing the Liouville superopertor of the Lindbladian L = -\!\(\*FormBox[\(\*FractionBox[\(1\), \(2\)] \*UnderscriptBox[\(\[Sum]\), \(i, j\)]\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(i, j\)],
TraditionalForm]\)({\!\(\*FormBox[SubsuperscriptBox[\(A\), \(i\), \(\[Dagger]\)],
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(A\), \(j\)],
TraditionalForm]\), \[Rho]}-2 \!\(\*FormBox[SubscriptBox[\(A\), \(j\)],
TraditionalForm]\)\[Rho] \!\(\*FormBox[SubsuperscriptBox[\(A\), \(i\), \(\[Dagger]\)],
TraditionalForm]\)). Here h is the matrix basis, liops contains the Lindblad operators {\!\(\*FormBox[SubscriptBox[\(A\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(A\), \(2\)],
TraditionalForm]\), ..., \!\(\*FormBox[SubscriptBox[\(A\), \(m\)],
TraditionalForm]\)} and gammas contains the \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(i, j\)],
TraditionalForm]\) coefficients."

LiouvilleDaggerLindbladianFromLindbladOperators::usage = "LiouvilleLDaggerindbladianFromLindbladOperators[h, liops, gammas]: h, liops, gammas \[Element] SparseArray
Returns a SparseArray of dimension Length[h]\[Times]Length[h] containing the adjoint Liouville superopertor of the Lindbladian \!\(\*FormBox[SuperscriptBox[\(L\), \(\[Dagger]\)],
TraditionalForm]\) = -\!\(\*FormBox[\(\*FractionBox[\(1\), \(2\)] \*UnderscriptBox[\(\[Sum]\), \(i, j\)]\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(i, j\)],
TraditionalForm]\)({\!\(\*FormBox[SubsuperscriptBox[\(A\), \(i\), \(\[Dagger]\)],
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(A\), \(j\)],
TraditionalForm]\), \[Rho]}-2 \!\(\*FormBox[SubsuperscriptBox[\(A\), \(i\), \(\[Dagger]\)],
TraditionalForm]\)\[Rho] \!\(\*FormBox[SubscriptBox[\(A\), \(j\)],
TraditionalForm]\)). Here h is the matrix basis, liops contains the Lindblad operators {\!\(\*FormBox[SubscriptBox[\(A\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(A\), \(2\)],
TraditionalForm]\), ..., \!\(\*FormBox[SubscriptBox[\(A\), \(m\)],
TraditionalForm]\)} and gammas contains the \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(i, j\)],
TraditionalForm]\) coefficients."


TransitionLists::usage = "TransitionLists[i, Jlist, Flist, mFlist, levtrlist, laserlist, na, \[CapitalLambda], \[Delta], \[Phi], \[Gamma], W, M] : i, na \[Element] Integers, Jlist, Flist, mFlist \[Element] Lists of Integers, laserlist \[Element] Lists, \[CapitalLambda], \[Delta], \[Phi], \[Gamma], W, M \[Element] Symbols
TransitionLists[i, Jlist, Flist, mFlist, levtrlist, laserlist, na, \[CapitalLambda], \[CapitalDelta]\[Epsilon], \[Delta], \[Phi], \[Gamma], W, M] : i, na \[Element] Integers, Jlist, Flist, mFlist \[Element] Lists of Integers, laserlist \[Element] Lists, \[CapitalLambda], \[CapitalDelta]\[Epsilon], \[Delta], \[Phi], \[Gamma], W, M \[Element] Symbols
Returns the configuration lists necessary to build the master equations for alkali-metal atoms. i is the Integer nuclear angular momentum quantum number of the na atoms in the system. Jlist = {\!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(j\), \(2\)],
TraditionalForm]\), ..., \!\(\*FormBox[SubscriptBox[\(j\), \(n\)],
TraditionalForm]\)} is a List of the electronic angular momentum quantum numbers for the n orbitals considered in the model. Flist = {\!\(\*FormBox[SubscriptBox[\(f\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(f\), \(2\)],
TraditionalForm]\), ..., \!\(\*FormBox[SubscriptBox[\(f\), \(n\)],
TraditionalForm]\)} is a List of  the hyperfine total angular momentums of the orbitals considered in the model. mFlist = {{\!\(\*FormBox[SubscriptBox[\(m\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(1, 2\)],
TraditionalForm]\), ...}, {\!\(\*FormBox[SubscriptBox[\(m\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(2, 2\)],
TraditionalForm]\), ... }, ..., {\!\(\*FormBox[SubscriptBox[\(m\), \(n, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(n, 2\)],
TraditionalForm]\), ... } } is a List of Lists, each containing the magnetic quantum numbers to be included in each of the orbitals.  Where, following the usual restrictions for the magnetic quantum numbers,  -\!\(\*FormBox[SubscriptBox[\(F\), \(k\)],
TraditionalForm]\) \[LessEqual] \!\(\*FormBox[SubscriptBox[\(m\), \(k, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(k, 2\)],
TraditionalForm]\), .... \[LessEqual] \!\(\*FormBox[SubscriptBox[\(F\), \(k\)],
TraditionalForm]\). Thus, at most {\!\(\*FormBox[SubscriptBox[\(m\), \(k, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(k, 2\)],
TraditionalForm]\), ....} = Range[-\!\(\*FormBox[\(\*SubscriptBox[\(F\), \(k\)]\(,\)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(F\), \(k\)],
TraditionalForm]\)]. The configuration variable levtrlist  = {{\!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\)}, ...} is a list containing the transitions where \!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\), ... index the groups of quantum levels characterized by the quantum numbers {\!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(f\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(j\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(f\), \(2\)],
TraditionalForm]\)), ... , respectively. The configuration variable for the coherent sources interacting with the atom is the two-level nested list laserlist. The innermost list {{\!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\)} , \!\(\*
StyleBox[\"e\",\nFontWeight->\"Bold\"]\) } has two elements. The first one is of the form {\!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\)} where  \!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\) index the two groups of quantum levels coupled by the coherent source. The second element \!\(\*
StyleBox[\"e\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)= {\!\(\*FormBox[SubscriptBox[\(e\), \(H\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(e\), \(V\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(e\), \(z\)],
TraditionalForm]\)} is the polarization unit vector of the source. TransitionLists only includes Rabi terms for those transitions that have non-vanishing contributions. The configuration Lists output are: levels, transitions, transdd, transLi, transCE. levels is a three-level nested list that primarily contains information about the orbitals' quantum numbers. The innermost list is of the form {\!\(\*FormBox[SubscriptBox[\(n\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(m\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(f\), \(1\)],
TraditionalForm]\)} where \!\(\*FormBox[SubscriptBox[\(n\), \(1\)],
TraditionalForm]\) indexes the orbital and \!\(\*FormBox[SubscriptBox[\(m\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(f\), \(1\)],
TraditionalForm]\) are the corresponding quantum numbers. The next level of the list groups together levels with the same \!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\)and \!\(\*FormBox[SubscriptBox[\(f\), \(1\)],
TraditionalForm]\). Finally, the outermost list collects all these groups. transitions is a two-level nested list containing detailed information about the available transitions. The innermost list is of the form {q, {\!\(\*FormBox[SubscriptBox[\(n\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(n\), \(2\)],
TraditionalForm]\)}, \[CapitalDelta]m, \[LeftAngleBracket]\!\(\*
StyleBox[\"p\",\nFontWeight->\"Bold\"]\)\[RightAngleBracket]} where q indexes the group of transitions, \!\(\*FormBox[SubscriptBox[\(n\), \(1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(n\), \(2\)],
TraditionalForm]\) are the orbitals' tags, \[CapitalDelta]m is the change in the magnetic quantum number and \[LeftAngleBracket]\!\(\*
StyleBox[\"p\",\nFontWeight->\"Bold\"]\)\[RightAngleBracket] represents the angular part of the dipole moment matrix element. transdd and transCE are the configuration variables needed by Ham and HamDressed. transLi is the configuration variable needed by LiouvilleLindbladian. The variable transdd = {{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[CapitalOmega]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(2\)],
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions corresponding to the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms (\!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)\[NotEqual]\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Beta]\), \(k\)]\),
TraditionalForm]\)). The strength of the interaction is given by \!\(\*FormBox[\(\*SubscriptBox[\(\[CapitalOmega]\), \(k\)]\(.\)\(\\\ \)\),
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) is the detuning between these two transitions. For \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) to be significant, it must be much smaller than both energy transitions themselves. Although typically \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\)=0, if \[CapitalDelta]\[Epsilon] is provided as an argument of TransitionLists, it yields \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) = \[CapitalDelta]\!\(\*FormBox[SubscriptBox[\(\[Epsilon]\), \(\(1\)\(\\\ \)\)],
TraditionalForm]\)+ \[CapitalDelta]\!\(\*FormBox[SubscriptBox[\(\[Epsilon]\), \(\(2\)\(\\\ \)\)],
TraditionalForm]\)+ ... where \[CapitalDelta]\!\(\*FormBox[\(\*SubscriptBox[\(\[Epsilon]\), \(\(1\)\(\\\ \)\)]\(,\)\(\\\ \)\),
TraditionalForm]\) \[CapitalDelta]\!\(\*FormBox[SubscriptBox[\(\[Epsilon]\), \(\(2\)\(\\\ \)\)],
TraditionalForm]\), .... are the energy shifts due to the Zeeman splitting, for example. If \[CapitalDelta]\[Epsilon] is not provided as an argument of TransitionLists, it yields \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(k\)],
TraditionalForm]\) = 0.  The configuration variable transLi = {{\!\(\*FormBox[SubscriptBox[\(tr\), \(1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(1\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(1\)],
TraditionalForm]\) , \!\(\*FormBox[SubscriptBox[\(\[Delta]\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(tr\), \(2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(tr\), \(2, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(2\)],
TraditionalForm]\),  \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(\[Gamma]\), \(2\)],
TraditionalForm]\) ,\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(\[Delta]\), \(2\)]\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the dipole-dipole interaction.  \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)}, \!\(\*FormBox[SubscriptBox[\(tr\), \(k, 1\)],
TraditionalForm]\)={\!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)} are the two interacting dipole transitions \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1, 2\)],
TraditionalForm]\)) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\)\[RightArrow] \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\) (between the quantum levels tagged as \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2, 2\)],
TraditionalForm]\)) of the two distinct \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th and \!\(\*FormBox[SubscriptBox[\(\[Beta]\), \(k\)],
TraditionalForm]\)-th atoms. transCE = {{{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(1, 1\)], \\\ \*SubscriptBox[\(ql\), \(1, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\*SubscriptBox[\(\[Alpha]\), \(1\)], \\\ \*SubscriptBox[\(Rb\), \(1\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(1\)], \\\ \*SubscriptBox[\(\[Phi]\), \(1\)]\),
TraditionalForm]\)}, {{\!\(\*FormBox[\(\*SubscriptBox[\(ql\), \(2, 1\)], \\\ \*SubscriptBox[\(ql\), \(2, 2\)]\),
TraditionalForm]\)}, \!\(\*FormBox[\(\(\\\ \)\(\*SubscriptBox[\(\[Alpha]\), \(2\)], \\\ \*SubscriptBox[\(Rb\), \(2\)], \\\ \*SubscriptBox[\(\[CapitalDelta]\), \(2\)], \\\ \*SubscriptBox[\(\[Phi]\), \(2\)]\)\),
TraditionalForm]\)}, \[Ellipsis]} contains the parameters for the light-matter interaction of the \!\(\*FormBox[SubscriptBox[\(\[Alpha]\), \(k\)],
TraditionalForm]\)-th atom. These parameters are: the two quantum levels excited by the laser \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 1\)],
TraditionalForm]\)and \!\(\*FormBox[SubscriptBox[\(ql\), \(k, 2\)],
TraditionalForm]\), the Rabi parameter \!\(\*FormBox[SubscriptBox[\(Rb\), \(k\)],
TraditionalForm]\), the detuning  \!\(\*FormBox[SubscriptBox[\(\[CapitalDelta]\), \(k\)],
TraditionalForm]\) and the phase \!\(\*FormBox[SubscriptBox[\(\[Phi]\), \(k\)],
TraditionalForm]\). \[CapitalLambda], \[CapitalDelta]\[Epsilon], \[Delta] and \[Phi] are the Symbols used as Rabi parameters, energy shifts and, detuning and phase,  respectively. \[Gamma], W, M are the Symbols used as the dipole-dipole couplings."


FarField::usage = "FarField[transitions, levtrlist, countlist, atompos, nl, na, \[Kappa]] : transitions, levtrlist, countlist, atompos \[Element] Lists, nl, na \[Element] Integers,  \[Kappa] \[Element] Symbols.
FarField[transitions, levtrlist, countlist, atompos, nl, na, \[Kappa], \[CapitalDelta]\[Kappa]] : transitions, levtrlist, countlist, atompos \[Element] Lists, nl, na \[Element] Integers,  \[Kappa], \[CapitalDelta]\[Kappa] \[Element] Symbols.
Returns the far field operators a list of SparseArray objects of dimension Length[count-list] with the correlations of the far field given by \!\(\*FormBox[SubsuperscriptBox[\(E\), \(l\), \(\[Dagger]\)],
TraditionalForm]\)\!\(\*FormBox[SubscriptBox[\(E\), \(l\)],
TraditionalForm]\)where \!\(\*FormBox[SubscriptBox[\(E\), \(l\)],
TraditionalForm]\) = \!\(\*FormBox[UnderoverscriptBox[\(\[Sum]\), \(\[Alpha] = 1\), \(na\)],
TraditionalForm]\)\!\(\*FormBox[UnderscriptBox[\(\[Sum]\), \(n\)],
TraditionalForm]\)\!\(\*FormBox[\(\*FractionBox[
RowBox[{SubscriptBox[
StyleBox[\"p\",\nFontWeight->\"Bold\"], \"n\"], \"-\", 
RowBox[{SubscriptBox[OverscriptBox[
StyleBox[\"R\",\nFontWeight->\"Bold\"], \"^\"], \"\[Alpha]\"], 
RowBox[{SubscriptBox[OverscriptBox[
StyleBox[\"R\",\nFontWeight->\"Bold\"], \"^\"], \"\[Alpha]\"], \"\[CenterDot]\", SubscriptBox[
StyleBox[\"p\",\nFontWeight->\"Bold\"], \"n\"]}]}]}], SubscriptBox[\"R\", \"\[Alpha]\"]] \*SubsuperscriptBox[\(k\), \(n\), \(2\)] Exp[\(-\(\*SubscriptBox[\(ik\), \(n\)](\*SubscriptBox[\(R\), \(\[Alpha]\)] - R)\)\)] \*SubscriptBox[\(\[Sigma]\), \(n, \[Alpha]\)]\),
TraditionalForm]\) is the far field operator in arbitrary units.  \!\(\*FormBox[SubscriptBox[
StyleBox[\"p\",\nFontWeight->\"Bold\"], \"n\"],
TraditionalForm]\) is the dipole matrix element of the \!\(\*FormBox[\(n\),
TraditionalForm]\)-th transition, \!\(\*FormBox[\(\*SubscriptBox[
StyleBox[\"R\",\nFontWeight->\"Bold\"], \"\[Alpha]\"] = \*
StyleBox[\"R\",\nFontWeight->\"Bold\"] - \*SubscriptBox[
StyleBox[\"r\",\nFontWeight->\"Bold\"], \"\[Alpha]\"]\),
TraditionalForm]\)= {\!\(\*FormBox[SubscriptBox[\(X\), \(\[Alpha]\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(Y\), \(\[Alpha]\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(Z\), \(\[Alpha]\)],
TraditionalForm]\)}  is the vector from the \[Alpha]-th atom located at \!\(\*FormBox[SubscriptBox[
StyleBox[\"r\",\nFontWeight->\"Bold\"], \"\[Alpha]\"],
TraditionalForm]\) = {\!\(\*FormBox[SubscriptBox[\(x\), \(\[Alpha]\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(y\), \(\[Alpha]\)],
TraditionalForm]\) ,\!\(\*FormBox[\(\(\\\ \)\*SubscriptBox[\(z\), \(\[Alpha]\)]\),
TraditionalForm]\)} to the detector at position \!\(\*
StyleBox[\"R\",\nFontWeight->\"Bold\"]\) = {X, Y , Z}. The magnitude of the transition's wave vector is  \!\(\*FormBox[SubscriptBox[\(k\), \(n\)],
TraditionalForm]\). The SparseArray object \!\(\*FormBox[SubscriptBox[\(\[Sigma]\), \(n, \[Alpha]\)],
TraditionalForm]\) = \[VerticalSeparator]\!\(\*FormBox[\(\*SubscriptBox[\(\*SubscriptBox[\(n\), \(1\)]\(\[RightAngleBracket]\)\), \(\[Alpha]\\\ \[Alpha]\)] \[LeftAngleBracket]\*SubscriptBox[\(n\), \(2\)]\),
TraditionalForm]\)\[VerticalSeparator] is the transition operator associated with the \!\(\*FormBox[\(n\),
TraditionalForm]\)-th transition between the \!\(\*FormBox[SubscriptBox[\(n\), \(1\)],
TraditionalForm]\)and \!\(\*FormBox[SubscriptBox[\(n\), \(2\)],
TraditionalForm]\) orbitals of atom \[Alpha] as given by Sigma. The configuration variable transitions is a two-level nested list containing detailed information about the available transitions. The innermost list is of the form {q, {\!\(\*FormBox[SubscriptBox[\(n\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(n\), \(2\)],
TraditionalForm]\)}, \[CapitalDelta]m, \[LeftAngleBracket]\!\(\*
StyleBox[\"p\",\nFontWeight->\"Bold\"]\)\[RightAngleBracket]} where q indexes the group of transitions, \!\(\*FormBox[SubscriptBox[\(n\), \(1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(n\), \(2\)],
TraditionalForm]\) are the orbitals' tags, \[CapitalDelta]m is the change in the magnetic quantum number and \[LeftAngleBracket]\!\(\*
StyleBox[\"p\",\nFontWeight->\"Bold\"]\)\[RightAngleBracket] represents the angular part of the dipole moment matrix element. This variable might be obtained as part of the output of TransitionLists.  The configuration variable levtrlist  = {{\!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\)}, ...} is a list containing the transitions where \!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\), ... index the groups of quantum levels characterized by the quantum numbers {\!\(\*FormBox[SubscriptBox[\(j\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(f\), \(1\)],
TraditionalForm]\)}, {\!\(\*FormBox[SubscriptBox[\(j\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(f\), \(2\)],
TraditionalForm]\)), ... , respectively. This is also a configuration variable for TransitionLists. The configuration variable countlist has the structure {{{\!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\)}, \!\(\*
StyleBox[\"e\",\nFontWeight->\"Bold\"]\), \!\(\*
StyleBox[\"R\",\nFontWeight->\"Bold\"]\) }, ... } where \!\(\*FormBox[SubscriptBox[\(q\), \(1\)],
TraditionalForm]\) and \!\(\*FormBox[SubscriptBox[\(q\), \(2\)],
TraditionalForm]\) index the groups of quantum levels of the \!\(\*FormBox[\(n\),
TraditionalForm]\)-th transition, \!\(\*
StyleBox[\"e\",\nFontWeight->\"Bold\"]\) = {\!\(\*FormBox[SubscriptBox[\(e\), \(1\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(e\), \(2\)],
TraditionalForm]\), \!\(\*FormBox[SubscriptBox[\(e\), \(3\)],
TraditionalForm]\)} is the polarization unit vector measured by the detector positioned at \!\(\*
StyleBox[\"R\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\" \",\nFontWeight->\"Bold\"]\)= {X, Y , Z}. The Symbol \[Kappa] is used to obtain the magnitude of the wave vector  \!\(\*FormBox[SubscriptBox[\(k\), \(n\)],
TraditionalForm]\)in the following way. If the Symbol \[CapitalDelta]\[Kappa] is not provided as an argument of FarField, it is assumed  that the orbitals with the same quantum number f but different quantum number \!\(\*FormBox[\(m\),
TraditionalForm]\) are degenerate and therefore \!\(\*FormBox[\(\*SubscriptBox[\(k\), \(n\)] = \*SubscriptBox[\(\[Kappa]\), \(n\)]\),
TraditionalForm]\). If \[CapitalDelta]\[Kappa] is provided as an argument of FarField, it is assumed that the degeneracy between the orbitals with different magnetic quantum  numbers \!\(\*FormBox[\(m\),
TraditionalForm]\) is lifted (for example, due to Zeeman splitting). In the latter case \!\(\*FormBox[\(\*SubscriptBox[\(k\), \(n\)] = \*SubscriptBox[\(\[Kappa]\), \(n\)]\),
TraditionalForm]\)- \!\(\*FormBox[\(\*SubscriptBox[\(\[CapitalDelta]\[Kappa]\), SubscriptBox[\(n\), \(1\)]] + \*SubscriptBox[\(\[CapitalDelta]\[Kappa]\), SubscriptBox[\(n\), \(2\)]]\),
TraditionalForm]\)."


WDipoleDipoleElement::usage = "WDipoleDipoleElement[p1, p2, rhat, \[Zeta]] : p1, p2, rhat \[Element] Lists,  \[Zeta] \[Element] Symbols.
Returns the imaginary part of the Green's function that governs the propagation of the electromagnetic field. The dipole moment vectors are given by p1 = {p1x, p1y, p1z} and p2 = {p2x, p2y, p2z}. The unit vector rhat  = {x, y , z} points from atom \[Alpha] to atom \[Beta] when \[Alpha] \[NotEqual] \[Beta], and reduces to rhat= {0, 0, 0} in case it couples an atom with itself. The parameter \[Zeta] = \[Kappa] \!\(\*FormBox[SubscriptBox[\(r\), \(\[Alpha], \[Beta]\)],
TraditionalForm]\) where \[Kappa] denotes the magnitude of the wave vector and \!\(\*FormBox[SubscriptBox[\(r\), \(\[Alpha], \[Beta]\)],
TraditionalForm]\) is the distance between atoms \[Alpha] and \[Beta]."
MDipoleDipoleElement::usage = "MDipoleDipoleElement[p1, p2, rhat, \[Zeta]] : p1, p2, rhat \[Element] Lists,  \[Zeta] \[Element] Symbols.
Returns the real part of the Green's function that governs the propagation of the electromagnetic field. The dipole moment vectors are given by p1 = {p1x, p1y, p1z} and p2 = {p2x, p2y, p2z}. The unit vector rhat  = {x, y , z} points from atom \[Alpha] to atom \[Beta] when \[Alpha] \[NotEqual] \[Beta], and reduces to rhat= {0, 0, 0} in case it couples an atom with itself. The parameter \[Zeta] = \[Kappa] \!\(\*FormBox[SubscriptBox[\(r\), \(\[Alpha], \[Beta]\)],
TraditionalForm]\) where \[Kappa] denotes the magnitude of the wave vector and \!\(\*FormBox[SubscriptBox[\(r\), \(\[Alpha], \[Beta]\)],
TraditionalForm]\) is the distance between atoms \[Alpha] and \[Beta]."


Begin["`Private`"];


MultiAtomBasis[nl_,na_]:=Module[{n,splist,kk,q,h},
n=nl^na;
splist={};
Do[
AppendTo[splist,{ii,ii,ii}->1];
,{ii,1,nl}];
kk=nl;
Do[
kk+=1;
AppendTo[splist,{kk,ii,jj}->1/Sqrt[2]];
AppendTo[splist,{kk,jj,ii}->1/Sqrt[2]];
kk+=1;
AppendTo[splist,{kk,ii,jj}->-(I/Sqrt[2])];
AppendTo[splist,{kk,jj,ii}->I/Sqrt[2]];
,{ii,1,nl-1},{jj,ii+1,nl}];
q=SparseArray[splist,{nl^2,nl,nl}];
h=q;
Do[h=KroneckerProduct[h,q];
,{ii,2,na}];
Return[h]
]



Sigma[tr_,\[Alpha]_,nl_,na_]:=If[na==1,SparseArray[{tr[[1]],tr[[2]]}->1,nl],KroneckerProduct@@Table[If[ii==\[Alpha],SparseArray[{tr[[1]],tr[[2]]}->1,nl],SparseArray[Table[{jj,jj}->1,{jj,1,nl}]]],{ii,1,na}]]

SigmaT[tr_,\[Alpha]_,nl_,na_]:=If[na==1,SparseArray[{tr[[2]],tr[[1]]}->1,nl],KroneckerProduct@@Table[If[ii==\[Alpha],SparseArray[{tr[[2]],tr[[1]]}->1,nl],SparseArray[Table[{jj,jj}->1,{jj,1,nl}]]],{ii,1,na}]]

Sigmaz[tr_,\[Alpha]_,nl_,na_]:=If[na==1,SparseArray[{{tr[[1]],tr[[1]]}->1,{tr[[2]],tr[[2]]}->-1},nl],KroneckerProduct@@Table[If[ii==\[Alpha],SparseArray[{{tr[[1]],tr[[1]]}->1,{tr[[2]],tr[[2]]}->-1},nl],SparseArray[Table[{jj,jj}->1,{jj,1,nl}]]],{ii,1,na}]]



Ham[transCE_,transdd_,nl_,na_,t_]:=Module[{lCE,ldd,n,HCE,Hdd},
lCE=Length[transCE];
ldd=Length[transdd];
If[lCE!=0,
HCE=-Sum[tra[[3]](Exp[I (-tra[[4]]t+tra[[5]])]Sigma[tra[[1]],tra[[2]],nl,na]+Exp[I (tra[[4]]t-tra[[5]])]SigmaT[tra[[1]],tra[[2]],nl,na]),{tra,transCE}];,
n=nl^na;
HCE=SparseArray[{},{n,n}];
];
If[ldd!=0,
Hdd= Sum[tra[[5]]Exp[I tra[[6]]t]SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na],{tra, transdd}];,
n=nl^na;
Hdd=SparseArray[{},{n,n}];
];
Return[SparseArray[HCE+Hdd]]
]

HamDressed[transCE_,transdd_,nl_,na_]:=Module[{HRE,Hdd,dim,rot,Ht},
HRE=-Sum[tra[[3]](Exp[I tra[[5]]]Sigma[tra[[1]],tra[[2]],nl,na]+Exp[-I tra[[5]]]SigmaT[tra[[1]],tra[[2]],nl,na]),{tra,transCE}];
Hdd= Sum[tra[[5]]SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na],{tra, transdd}];
rot=RotatingFrameParms[transCE];
dim=Dimensions[rot][[1]];
Ht=Sum[rot[[ii]]Sigmaz[transCE[[ii,1]],transCE[[ii,2]],nl,na],{ii,1,dim}];
Return[SparseArray[HRE+Hdd+Ht]]
]

RotatingFrameParms[transCE_]:=Module[{dim,i1,i2,j1,j2,var,vec,mat,cteq,cttr,\[Alpha],\[Beta], rotparms},
dim=Dimensions[transCE][[1]];
var=Table[Subscript[\[Alpha],ii],{ii,1,dim}];
vec=Table[tra[[4]],{tra,transCE}];
mat=Table[0,{ii,1,dim},{jj,1,dim}];
cteq=0;
Do[
cteq+=1;
i1=tr1[[1,1]];
i2=tr1[[1,2]];
\[Alpha]=tr1[[2]];
cttr=0;
Do[
cttr+=1;
j1=tr2[[1,1]];
j2=tr2[[1,2]];
\[Beta]=tr2[[2]];
If[\[Alpha]==\[Beta],
If[i1!=j1&&i1!=j2 &&i2!=j1 && i2!=j2,mat[[cteq,cttr]]+=0];
If[i1==j1&&i1!=j2 &&i2!=j1 && i2!=j2,mat[[cteq,cttr]]+=1];
If[i1!=j1&&i1==j2 &&i2!=j1 && i2!=j2,mat[[cteq,cttr]]+=-1];
If[i1!=j1&&i1!=j2 &&i2==j1 && i2!=j2,mat[[cteq,cttr]]+=-1];
If[i1!=j1&&i1!=j2 &&i2!=j1 && i2==j2,mat[[cteq,cttr]]+=1];
If[i1==j1&&i1!=j2 &&i2!=j1 && i2==j2,mat[[cteq,cttr]]+=2];
If[i1!=j1&&i1==j2 &&i2==j1 && i2!=j2,mat[[cteq,cttr]]+=-2];
];
,{tr2,transCE}];
,{tr1,transCE}];
rotparms =-Simplify[Inverse[mat] . vec];
Return[rotparms]
]

RotatingFrameTrans[transCE_, nl_, na_, t_]:=Module[{nt, rot, dim, R, Rt},
nt=nl^na;
rot=RotatingFrameParms[transCE];
dim=Dimensions[rot][[1]];
R=IdentityMatrix[nt];
Rt=IdentityMatrix[nt];
Do[
R=MatrixExp[I rot[[ii]]t Sigmaz[transCE[[ii,1]],transCE[[ii,2]],nl,na]] . R;
Rt=Rt . MatrixExp[-I rot[[ii]]t Sigmaz[transCE[[ii,1]],transCE[[ii,2]],nl,na]];
,{ii,1,dim}];
Return[{SparseArray[Table[{ii,ii}->Rt[[ii,ii]],{ii,Dimensions[Rt][[1]]}],Dimensions[Rt][[1]]],
SparseArray[Table[{ii,ii}->R[[ii,ii]],{ii,Dimensions[R][[1]]}],Dimensions[R][[1]]]}]
]

RotatingFrameTrans[h_, transCE_, nl_, na_, t_]:=Module[{nt, rot, dim, R, Rt, U, Ut},
nt=nl^na;
rot=RotatingFrameParms[transCE];
dim=Dimensions[rot][[1]];
R=IdentityMatrix[nt];
Rt=IdentityMatrix[nt];
Do[
R=MatrixExp[I rot[[ii]]t Sigmaz[transCE[[ii,1]],transCE[[ii,2]],nl,na]] . R;
Rt=Rt . MatrixExp[-I rot[[ii]]t Sigmaz[transCE[[ii,1]],transCE[[ii,2]],nl,na]];
,{ii,1,dim}];
U = SparseArray[Table[{ii,ii}->Rt[[ii,ii]],{ii,Dimensions[Rt][[1]]}],Dimensions[Rt][[1]]];
Ut = SparseArray[Table[{ii,ii}->R[[ii,ii]],{ii,Dimensions[R][[1]]}],Dimensions[R][[1]]];
Return[{U, Ut,
TensorContract[h . U . Transpose[h] . Ut,{{2,4}}],
TensorContract[h . Ut . Transpose[h] . U,{{2,4}}]}]
]



LiouvilleLindbladian[h_, transLi_, nl_, na_, t_]:=SparseArray[TensorContract[h . Sum[1/2 tra[[5]]Exp[I tra[[6]]t](2Sigma[tra[[2]],tra[[4]],nl,na] . Transpose[h] . SigmaT[tra[[1]],tra[[3]],nl,na]-SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na] . Transpose[h]-Transpose[h] . SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na]),{tra,transLi}],{{2,4}}]]
LiouvilleLindbladian[h_, transLi_, nl_, na_]:=SparseArray[TensorContract[h . Sum[1/2 tra[[5]](2Sigma[tra[[2]],tra[[4]],nl,na] . Transpose[h] . SigmaT[tra[[1]],tra[[3]],nl,na]-SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na] . Transpose[h]-Transpose[h] . SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na]),{tra,transLi}],{{2,4}}]]

LiouvilleLindbladianDagger[h_, transLi_, nl_, na_, t_]:=SparseArray[TensorContract[h . Sum[1/2 tra[[5]]Exp[I tra[[6]]t](2SigmaT[tra[[1]],tra[[3]],nl,na] . Transpose[h] . Sigma[tra[[2]],tra[[4]],nl,na]-SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na] . Transpose[h]-Transpose[h] . SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na]),{tra,transLi}],{{2,4}}]]
LiouvilleLindbladianDagger[h_, transLi_, nl_, na_]:=SparseArray[TensorContract[h . Sum[1/2 tra[[5]](2SigmaT[tra[[1]],tra[[3]],nl,na] . Transpose[h] . Sigma[tra[[2]],tra[[4]],nl,na]-SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na] . Transpose[h]-Transpose[h] . SigmaT[tra[[1]],tra[[3]],nl,na] . Sigma[tra[[2]],tra[[4]],nl,na]),{tra,transLi}],{{2,4}}]]



LiouvilleCommutator[h_, H_]:=SparseArray[I TensorContract[h . (H . Transpose[h]-Transpose[h] . H),{{2,4}}]]



LiouvilleMasterEquation[q_, Li_, t_]:=Thread[D[q,t] == Li . q]

LiouvilleAdjointMasterEquation[q_, Lit_, t_]:=Thread[D[q,t]== q . Lit]


MasterEquation[h_,q_,q0_,transCE_,transdd_,transLi_,nl_,na_,t_]:=Module[{lCE,ldd,lLi,n,ham,LiouvilleH,LiouvilleL,Li,incon},
lCE=Length[transCE];
ldd=Length[transdd];
lLi=Length[transLi];
n=nl^(2na);
If[lCE!=0||ldd!=0,
ham=Ham[transCE, transdd, nl, na, t];
LiouvilleH = -LiouvilleCommutator[h,ham];,
LiouvilleH = SparseArray[{},{n,n}];
];
If[lLi!=0,
LiouvilleL = LiouvilleLindbladian[h, transLi,nl,na];,
LiouvilleL = SparseArray[{},{n,n}];
];
If[lCE==0 && ldd==0 && lLi==0,
Li=SparseArray[{},{n,n}];,
Li=CleanUp[LiouvilleH+LiouvilleL];
];
incon=Thread[(Normal[q]/.{t->0})==Re[Proj[h,q0]]];
Return[Join[Expand[LiouvilleMasterEquation[q,Li,t]],incon]]
]

AdjointMasterEquation[h_,q_,q0_,transCE_,transdd_,transLi_,nl_,na_,t_]:=Module[{lCE,ldd,lLi,n,ham,LiouvilleH,LiouvilleL,Li,incon},
lCE=Length[transCE];
ldd=Length[transdd];
lLi=Length[transLi];
n=nl^(2na);
If[lCE!=0||ldd!=0,
ham=Ham[transCE, transdd, nl, na, t];
LiouvilleH = LiouvilleCommutator[h,ham];,
LiouvilleH = SparseArray[{},{n,n}];
];
If[lLi!=0,
LiouvilleL = LiouvilleLindbladian[h, transLi,nl,na];,
LiouvilleL = SparseArray[{},{n,n}];
];
If[lCE==0 && ldd==0 && lLi==0,
Li=SparseArray[{},{n,n}];,
Li=CleanUp[LiouvilleH+LiouvilleL];
];
incon=Thread[(Normal[q]/.{t->0})==Proj[h,q0]];
Return[Join[Expand[LiouvilleMasterEquation[q,Li,t]],incon]]
]


CleanUp[Op_]:=SparseArray[Simplify[ExpToTrig[ArrayRules[Op]]]]



Proj[h_,Op_]:=TensorContract[h . Op,{{2,3}}]

ExpectationValue[h_,q_,Op_]:=Proj[h,Op] . q


InitialConditions[h_, q_, q0_, t_]:=Thread[(Normal[q]/.{t->0})==Proj[h,q0]]


FilteredClebschGordan[{j1_,m1_},{j2_,m2_},{j_,m_}]:=If[Abs[j1-j2]<=j<=j1+j2&&m==m1+m2,ClebschGordan[{j1,m1},{j2,m2},{j,m}],0]

DipoleMatrixElement[i_,jp_,j_,fp_,f_,mfp_,mf_]:=Simplify[Sum[Conjugate[FilteredClebschGordan[{jp,mjp},{i,mi},{fp,mfp}]]FilteredClebschGordan[{j,mj},{i,mi},{f,mf}] 1/Sqrt[2j+1] (FilteredClebschGordan[{j,mj},{1,-1},{jp,mjp}] 1/Sqrt[2] {1,I,0}+FilteredClebschGordan[{j,mj},{1,1},{jp,mjp}] 1/Sqrt[2] {-1,I,0}+FilteredClebschGordan[{j,mj},{1,0},{jp,mjp}]{0,0,1}),{mj,-j,j},{mjp,-jp,jp},{mi,-i,i}]]


LiouvilleLindbladianFromLindbladOperators[h_,liops_,gammas_]:=Module[{t1,t2,t3},
t1=TensorContract[Conjugate[Transpose[liops,{1,3,2}]] . Transpose[liops] . Transpose[h] . Transpose[h],{{2,6}}];
t2=Transpose[t1,{1,2,4,3}];
t3=Transpose[TensorContract[liops . Transpose[h] . Conjugate[Transpose[liops,{2,3,1}]] . Transpose[h],{{2,6}}],{2,4,1,3}];
(* Return[CleanUp[TensorContract[Transpose[gammas].(-(1/2)(t1+t2)+t3),{{1,2}}]]] *);
If[Length[gammas]==1,Return[TensorContract[gammas[[1]] (-(1/2)(t1+t2)+t3),{{1,2}}]],Return[TensorContract[Transpose[gammas] . (-(1/2)(t1+t2)+t3),{{1,2}}]]];
]

LiouvilleDaggerLindbladianFromLindbladOperators[h_,liops_,gammas_]:=Module[{t1,t2,t3},
t1=TensorContract[Conjugate[Transpose[liops,{1,3,2}]] . Transpose[liops] . Transpose[h] . Transpose[h],{{2,6}}];
t2=Transpose[t1,{1,2,4,3}];
t3=Transpose[TensorContract[Conjugate[Transpose[liops,{1,3,2}]] . Transpose[h] . Transpose[liops] . Transpose[h],{{2,6}}],{1,4,2,3}];
(* Return[CleanUp[TensorContract[Transpose[gammas].(-(1/2)(t1+t2)+t3),{{1,2}}]]] *);
If[Length[gammas]==1,Return[TensorContract[gammas[[1]] (-(1/2)(t1+t2)+t3),{{1,2}}]],Return[TensorContract[Transpose[gammas] . (-(1/2)(t1+t2)+t3),{{1,2}}]]];
]


TransitionLists[i_,Jlist_,Flist_,mFlist_,levtrlist_,lasertrlist_,na_, \[CapitalLambda]_, \[CapitalDelta]\[Epsilon]_, \[Delta]_, \[Phi]_, \[Gamma]_, W_, M_]:=Module[{levels,lev,line,transLi,coLi,transdd,codd,transitions,tr,orbs1,orbs2,orbtrlist,prod,transCE,ctr,lev1,lev2,pos,ep,et,int,jp,j,mfp,mf,f,fp,p},
levels={};
lev=0;
Do[
line={};
Do[
lev+=1;
AppendTo[line,{lev,ll,Jlist[[jj]],Flist[[jj]]}];
,{ll,mFlist[[jj]]}];
AppendTo[levels,line];
,{jj,Length[Flist]}];
transLi={};
coLi=0;
transdd={};
codd=0;
transitions={};
Do[
tr=levtrlist[[ii]];
orbs1=levels[[tr[[1]]]];
orbs2=levels[[tr[[2]]]];
orbtrlist={};
Do[
Do[
If[Abs[or1[[2]]-or2[[2]]]<=1,
jp=or2[[3]];
j=or1[[3]];
fp=or2[[4]];
f=or1[[4]];
mfp=or2[[2]];
mf=or1[[2]];
p=DipoleMatrixElement[i,jp,j,fp,f,mfp,mf];
AppendTo[orbtrlist,{ii,{or1[[1]],or2[[1]]},or2[[2]]-or1[[2]],p}];
AppendTo[transitions,{ii,{or1[[1]],or2[[1]]},or2[[2]]-or1[[2]],p}];
];
,{or2,orbs2}];
,{or1,orbs1}];
Do[
Do[
prod=Simplify[or1[[4]] . Conjugate[or2[[4]]]];
If[ Abs[prod]!=0,
Do[
If[\[Alpha]==\[Beta],
coLi+=1;
AppendTo[transLi,{or1[[2]],or2[[2]],\[Alpha],\[Beta],prod Subscript[\[Gamma],or1[[1]]],Subscript[\[CapitalDelta]\[Epsilon],or1[[2,1]]]-Subscript[\[CapitalDelta]\[Epsilon],or1[[2,2]]]-Subscript[\[CapitalDelta]\[Epsilon],or2[[2,1]]]+Subscript[\[CapitalDelta]\[Epsilon],or2[[2,2]]]}];
,
coLi+=1;
codd+=1;
AppendTo[transLi,{or1[[2]],or2[[2]],\[Alpha],\[Beta],prod Subscript[\[Gamma],or1[[1]]]Subscript[W,coLi],Subscript[\[CapitalDelta]\[Epsilon],or1[[2,1]]]-Subscript[\[CapitalDelta]\[Epsilon],or1[[2,2]]]-Subscript[\[CapitalDelta]\[Epsilon],or2[[2,1]]]+Subscript[\[CapitalDelta]\[Epsilon],or2[[2,2]]]}];
AppendTo[transdd,{or1[[2]],or2[[2]],\[Alpha],\[Beta],prod Subscript[\[Gamma],or1[[1]]]Subscript[M,codd],Subscript[\[CapitalDelta]\[Epsilon],or1[[2,1]]]-Subscript[\[CapitalDelta]\[Epsilon],or1[[2,2]]]-Subscript[\[CapitalDelta]\[Epsilon],or2[[2,1]]]+Subscript[\[CapitalDelta]\[Epsilon],or2[[2,2]]]}];
];
,{\[Alpha],1,na},{\[Beta],1,na}];
];
,{or2,orbtrlist}];
,{or1,orbtrlist}];
,{ii,Length[levtrlist]}];

transCE={};
ctr=0;
Do[
ctr+=1;
lev1=levels[[tr[[1,1]]]];
lev2=levels[[tr[[1,2]]]];
ep=tr[[2]];
Do[
Do[
If[Abs[l1[[2]]-l2[[2]]]<=1,
pos=Position[transitions,{l1[[1]],l2[[1]]}][[1,1]];
et=transitions[[pos,4]];
int=et . Conjugate[ep];
If[int!=0,
Do[
AppendTo[transCE,{{l1[[1]],l2[[1]]},\[Alpha],int Subscript[\[CapitalLambda],ctr],Subscript[\[Delta],ctr]+Subscript[\[CapitalDelta]\[Epsilon],l2[[1]]]-Subscript[\[CapitalDelta]\[Epsilon],l1[[1]]],Subscript[\[Phi],ctr,\[Alpha]]}];
,{\[Alpha],1,na}];
];
];
,{l2,lev2}];
,{l1,lev1}];
,{tr,lasertrlist}];
Return[{levels,transitions,transdd, transLi,transCE}]
]

TransitionLists[i_,Jlist_,Flist_,mFlist_,levtrlist_,lasertrlist_,na_, \[CapitalLambda]_, \[Delta]_, \[Phi]_, \[Gamma]_, W_, M_]:=Module[{levels,lev,line,transLi,coLi,transdd,codd,transitions,tr,orbs1,orbs2,orbtrlist,prod,transCE,ctr,lev1,lev2,pos,ep,et,int,jp,j,mfp,mf,f,fp,p},
levels={};
lev=0;
Do[
line={};
Do[
lev+=1;
AppendTo[line,{lev,ll,Jlist[[jj]],Flist[[jj]]}];
,{ll,mFlist[[jj]]}];
AppendTo[levels,line];
,{jj,Length[Flist]}];
transLi={};
coLi=0;
transdd={};
codd=0;
transitions={};
Do[
tr=levtrlist[[ii]];
orbs1=levels[[tr[[1]]]];
orbs2=levels[[tr[[2]]]];
orbtrlist={};
Do[
Do[
If[Abs[or1[[2]]-or2[[2]]]<=1,
jp=or2[[3]];
j=or1[[3]];
fp=or2[[4]];
f=or1[[4]];
mfp=or2[[2]];
mf=or1[[2]];
p=DipoleMatrixElement[i,jp,j,fp,f,mfp,mf];
AppendTo[orbtrlist,{ii,{or1[[1]],or2[[1]]},or2[[2]]-or1[[2]],p}];
AppendTo[transitions,{ii,{or1[[1]],or2[[1]]},or2[[2]]-or1[[2]],p}];
];
,{or2,orbs2}];
,{or1,orbs1}];
Do[
Do[
prod=Simplify[or1[[4]] . Conjugate[or2[[4]]]];
If[ Abs[prod]!=0,
Do[
If[\[Alpha]==\[Beta],
coLi+=1;
AppendTo[transLi,{or1[[2]],or2[[2]],\[Alpha],\[Beta],prod Subscript[\[Gamma],or1[[1]]],0}];
,
coLi+=1;
codd+=1;
AppendTo[transLi,{or1[[2]],or2[[2]],\[Alpha],\[Beta],prod Subscript[\[Gamma],or1[[1]]]Subscript[W,coLi],0}];
AppendTo[transdd,{or1[[2]],or2[[2]],\[Alpha],\[Beta],prod Subscript[\[Gamma],or1[[1]]]Subscript[M,codd],0}];
];
,{\[Alpha],1,na},{\[Beta],1,na}];
];
,{or2,orbtrlist}];
,{or1,orbtrlist}];
,{ii,Length[levtrlist]}];

transCE={};
ctr=0;
Do[
ctr+=1;
lev1=levels[[tr[[1,1]]]];
lev2=levels[[tr[[1,2]]]];
ep=tr[[2]];
Do[
Do[
If[Abs[l1[[2]]-l2[[2]]]<=1,
pos=Position[transitions,{l1[[1]],l2[[1]]}][[1,1]];
et=transitions[[pos,4]];
int=et . Conjugate[ep];
If[int!=0,
Do[
AppendTo[transCE,{{l1[[1]],l2[[1]]},\[Alpha],int Subscript[\[CapitalLambda],ctr],Subscript[\[Delta],ctr],Subscript[\[Phi],ctr,\[Alpha]]}];
,{\[Alpha],1,na}];
];
];
,{l2,lev2}];
,{l1,lev1}];
,{tr,lasertrlist}];
Return[{levels,transitions,transdd, transLi,transCE}]
]


FarField[transitions_,levtrlist_,countlist_, atompos_,nl_,na_,\[Kappa]_,\[CapitalDelta]\[Kappa]_]:=Module[{Ops,trn,cont,tr,evec,kn,Rv,Rn,Ra,Ran,postr,wheretr,firstpass,ptr,rtr,fac,fact,El,Elt},
Ops={};
trn=transitions[[;;,1]];
cont=0;
Do[
cont+=1;
tr=co[[1]];
evec=co[[2]];
Rv=co[[3]];
Rn=Sqrt[Rv . Rv];
postr=Position[levtrlist,tr][[1,1]];
wheretr=Position[trn,postr][[;;,1]];
firstpass=True;
Do[
ptr=transitions[[we,4]];
rtr=transitions[[we,2]];
kn=Subscript[\[Kappa],cont]-Subscript[\[CapitalDelta]\[Kappa],rtr[[1]]]+Subscript[\[CapitalDelta]\[Kappa],rtr[[2]]];
fac={};
fact={};
Do[
Ra=Rv-atompos[[\[Alpha]]];
Ran=Sqrt[Ra . Ra];
AppendTo[fac,kn^2 Conjugate[evec] . ((ptr-Ra(Ra . ptr))/Ran)Exp[I kn(Ran-Rn)]];
AppendTo[fact,kn^2 evec . ((Conjugate[ptr]-Ra(Ra . Conjugate[ptr]))/Ran)Exp[-I kn(Ran-Rn)]];
,{\[Alpha],na}];
If[firstpass,
El=Sum[fac[[\[Alpha]]]Sigma[rtr,\[Alpha],nl,na],{\[Alpha],na}];
Elt=Sum[fact[[\[Alpha]]]SigmaT[rtr,\[Alpha],nl,na],{\[Alpha],na}];
firstpass=False,
El+=Sum[fac[[\[Alpha]]]Sigma[rtr,\[Alpha],nl,na],{\[Alpha],na}];
Elt+=Sum[fact[[\[Alpha]]]SigmaT[rtr,\[Alpha],nl,na],{\[Alpha],na}];
];
,{we,wheretr}];
AppendTo[Ops,SparseArray[Elt . El]];
,{co,countlist}];
Return[Ops]
]

FarField[transitions_,levtrlist_,countlist_, atompos_,nl_,na_,\[Kappa]_]:=Module[{Ops,trn,cont,tr,evec,kn,Rv,Rn,Ra,Ran,postr,wheretr,firstpass,ptr,rtr,fac,fact,El,Elt},
Ops={};
trn=transitions[[;;,1]];
cont=0;
Do[
cont+=1;
tr=co[[1]];
evec=co[[2]];
Rv=co[[3]];
Rn=Sqrt[Rv . Rv];
postr=Position[levtrlist,tr][[1,1]];
wheretr=Position[trn,postr][[;;,1]];
firstpass=True;
Do[
ptr=transitions[[we,4]];
rtr=transitions[[we,2]];
kn=Subscript[\[Kappa],cont];
fac={};
fact={};
Do[
Ra=Rv-atompos[[\[Alpha]]];
Ran=Sqrt[Ra . Ra];
AppendTo[fac,kn^2 Conjugate[evec] . ((ptr-Ra(Ra . ptr))/Ran)Exp[I kn(Ran-Rn)]];
AppendTo[fact,kn^2 evec . ((Conjugate[ptr]-Ra(Ra . Conjugate[ptr]))/Ran)Exp[-I kn(Ran-Rn)]];
,{\[Alpha],na}];
If[firstpass,
El=Sum[fac[[\[Alpha]]]Sigma[rtr,\[Alpha],nl,na],{\[Alpha],na}];
Elt=Sum[fact[[\[Alpha]]]SigmaT[rtr,\[Alpha],nl,na],{\[Alpha],na}];
firstpass=False,
El+=Sum[fac[[\[Alpha]]]Sigma[rtr,\[Alpha],nl,na],{\[Alpha],na}];
Elt+=Sum[fact[[\[Alpha]]]SigmaT[rtr,\[Alpha],nl,na],{\[Alpha],na}];
];
,{we,wheretr}];
AppendTo[Ops,SparseArray[Elt . El]];
,{co,countlist}];
Return[Ops]
]


WDipoleDipoleElement[p1_,p2_,rhat_,\[Zeta]_]:=3/2 ((p1 . Conjugate[p2]-(p1 . rhat)(Conjugate[p2] . rhat)) Sin[\[Zeta]]/\[Zeta]+(p1 . Conjugate[p2]-3(p1 . rhat)(Conjugate[p2] . rhat))(Cos[\[Zeta]]/\[Zeta]^2-Sin[\[Zeta]]/\[Zeta]^3))
MDipoleDipoleElement[p1_,p2_,rhat_,\[Zeta]_]:=3/4 (-(p1 . Conjugate[p2]-(p1 . rhat)(Conjugate[p2] . rhat)) Cos[\[Zeta]]/\[Zeta]+(p1 . Conjugate[p2]-3(p1 . rhat)(Conjugate[p2] . rhat))(Sin[\[Zeta]]/\[Zeta]^2+Cos[\[Zeta]]/\[Zeta]^3))


End[];


EndPackage[];
