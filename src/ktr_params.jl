const var_type_map = Compat.@compat Dict(
KTR_VARTYPE_CONTINUOUS => :Cont,
KTR_VARTYPE_INTEGER => :Int,
KTR_VARTYPE_BINARY => :Bin
)

const rev_var_type_map = Compat.@compat Dict(
:Cont => KTR_VARTYPE_CONTINUOUS,
:Int => KTR_VARTYPE_INTEGER,
:Bin => KTR_VARTYPE_BINARY
)

# grep "#define" knitro.h | grep "KTR_PARAM_" | awk '{ printf("\"%s\" => int32(%s),\n",$2,$3) }'
const paramName2Indx = Compat.@compat Dict(
"KTR_PARAM_NEWPOINT" => Compat.@compat(Int32(1001)),
"KTR_PARAM_HONORBNDS" => Compat.@compat(Int32(1002)),
"KTR_PARAM_ALGORITHM" => Compat.@compat(Int32(1003)),
"KTR_PARAM_ALG" => Compat.@compat(Int32(1003)),
"KTR_PARAM_BAR_MURULE" => Compat.@compat(Int32(1004)),
"KTR_PARAM_BARRULE" => Compat.@compat(Int32(1004)),
"KTR_PARAM_BAR_FEASIBLE" => Compat.@compat(Int32(1006)),
"KTR_PARAM_FEASIBLE" => Compat.@compat(Int32(1006)),
"KTR_PARAM_GRADOPT" => Compat.@compat(Int32(1007)),
"KTR_PARAM_HESSOPT" => Compat.@compat(Int32(1008)),
"KTR_PARAM_BAR_INITPT" => Compat.@compat(Int32(1009)),
"KTR_PARAM_LPSOLVER" => Compat.@compat(Int32(1012)),
"KTR_PARAM_MAXCGIT" => Compat.@compat(Int32(1013)),
"KTR_PARAM_MAXIT" => Compat.@compat(Int32(1014)),
"KTR_PARAM_OUTLEV" => Compat.@compat(Int32(1015)),
"KTR_PARAM_OUTMODE" => Compat.@compat(Int32(1016)),
"KTR_PARAM_SCALE" => Compat.@compat(Int32(1017)),
"KTR_PARAM_SHIFTINIT" => Compat.@compat(Int32(1018)),
"KTR_PARAM_SOC" => Compat.@compat(Int32(1019)),
"KTR_PARAM_DELTA" => Compat.@compat(Int32(1020)),
"KTR_PARAM_BAR_FEASMODETOL" => Compat.@compat(Int32(1021)),
"KTR_PARAM_FEASMODETOL" => Compat.@compat(Int32(1021)),
"KTR_PARAM_FEASTOL" => Compat.@compat(Int32(1022)),
"KTR_PARAM_FEASTOLABS" => Compat.@compat(Int32(1023)),
"KTR_PARAM_MAXTIMECPU" => Compat.@compat(Int32(1024)),
"KTR_PARAM_BAR_INITMU" => Compat.@compat(Int32(1025)),
"KTR_PARAM_MU" => Compat.@compat(Int32(1025)),
"KTR_PARAM_OBJRANGE" => Compat.@compat(Int32(1026)),
"KTR_PARAM_OPTTOL" => Compat.@compat(Int32(1027)),
"KTR_PARAM_OPTTOLABS" => Compat.@compat(Int32(1028)),
"KTR_PARAM_PIVOT" => Compat.@compat(Int32(1029)),
"KTR_PARAM_XTOL" => Compat.@compat(Int32(1030)),
"KTR_PARAM_DEBUG" => Compat.@compat(Int32(1031)),
"KTR_PARAM_MULTISTART" => Compat.@compat(Int32(1033)),
"KTR_PARAM_MSMAXSOLVES" => Compat.@compat(Int32(1034)),
"KTR_PARAM_MSMAXBNDRANGE" => Compat.@compat(Int32(1035)),
"KTR_PARAM_MSMAXTIMECPU" => Compat.@compat(Int32(1036)),
"KTR_PARAM_MSMAXTIMEREAL" => Compat.@compat(Int32(1037)),
"KTR_PARAM_LMSIZE" => Compat.@compat(Int32(1038)),
"KTR_PARAM_BAR_MAXCROSSIT" => Compat.@compat(Int32(1039)),
"KTR_PARAM_MAXCROSSIT" => Compat.@compat(Int32(1039)),
"KTR_PARAM_MAXTIMEREAL" => Compat.@compat(Int32(1040)),
"KTR_PARAM_PRECOND" => Compat.@compat(Int32(1041)),
"KTR_PARAM_BLASOPTION" => Compat.@compat(Int32(1042)),
"KTR_PARAM_BAR_MAXREFACTOR" => Compat.@compat(Int32(1043)),
"KTR_PARAM_BAR_MAXBACKTRACK" => Compat.@compat(Int32(1044)),
"KTR_PARAM_BLASOPTIONLIB" => Compat.@compat(Int32(1045)),
"KTR_PARAM_OUTAPPEND" => Compat.@compat(Int32(1046)),
"KTR_PARAM_OUTDIR" => Compat.@compat(Int32(1047)),
"KTR_PARAM_CPLEXLIB" => Compat.@compat(Int32(1048)),
"KTR_PARAM_BAR_PENRULE" => Compat.@compat(Int32(1049)),
"KTR_PARAM_BAR_PENCONS" => Compat.@compat(Int32(1050)),
"KTR_PARAM_MSNUMTOSAVE" => Compat.@compat(Int32(1051)),
"KTR_PARAM_MSSAVETOL" => Compat.@compat(Int32(1052)),
"KTR_PARAM_PRESOLVEDEBUG" => Compat.@compat(Int32(1053)),
"KTR_PARAM_MSTERMINATE" => Compat.@compat(Int32(1054)),
"KTR_PARAM_MSSTARTPTRANGE" => Compat.@compat(Int32(1055)),
"KTR_PARAM_INFEASTOL" => Compat.@compat(Int32(1056)),
"KTR_PARAM_LINSOLVER" => Compat.@compat(Int32(1057)),
"KTR_PARAM_BAR_DIRECTINTERVAL" => Compat.@compat(Int32(1058)),
"KTR_PARAM_PRESOLVE" => Compat.@compat(Int32(1059)),
"KTR_PARAM_PRESOLVE_TOL" => Compat.@compat(Int32(1060)),
"KTR_PARAM_BAR_SWITCHRULE" => Compat.@compat(Int32(1061)),
"KTR_PARAM_HESSIAN_NO_F" => Compat.@compat(Int32(1062)),
"KTR_PARAM_MA_TERMINATE" => Compat.@compat(Int32(1063)),
"KTR_PARAM_MA_MAXTIMECPU" => Compat.@compat(Int32(1064)),
"KTR_PARAM_MA_MAXTIMEREAL" => Compat.@compat(Int32(1065)),
"KTR_PARAM_MSSEED" => Compat.@compat(Int32(1066)),
"KTR_PARAM_MA_OUTSUB" => Compat.@compat(Int32(1067)),
"KTR_PARAM_MS_OUTSUB" => Compat.@compat(Int32(1068)),
"KTR_PARAM_XPRESSLIB" => Compat.@compat(Int32(1069)),
"KTR_PARAM_TUNER" => Compat.@compat(Int32(1070)),
"KTR_PARAM_TUNER_OPTIONSFILE" => Compat.@compat(Int32(1071)),
"KTR_PARAM_TUNER_MAXTIMECPU" => Compat.@compat(Int32(1072)),
"KTR_PARAM_TUNER_MAXTIMEREAL" => Compat.@compat(Int32(1073)),
"KTR_PARAM_TUNER_OUTSUB" => Compat.@compat(Int32(1074)),
"KTR_PARAM_TUNER_TERMINATE" => Compat.@compat(Int32(1075)),
"KTR_PARAM_LINSOLVER_OOC" => Compat.@compat(Int32(1076)),
"KTR_PARAM_BAR_RELAXCONS" => Compat.@compat(Int32(1077)),
"KTR_PARAM_MIP_METHOD" => Compat.@compat(Int32(2001)),
"KTR_PARAM_MIP_BRANCHRULE" => Compat.@compat(Int32(2002)),
"KTR_PARAM_MIP_SELECTRULE" => Compat.@compat(Int32(2003)),
"KTR_PARAM_MIP_INTGAPABS" => Compat.@compat(Int32(2004)),
"KTR_PARAM_MIP_INTGAPREL" => Compat.@compat(Int32(2005)),
"KTR_PARAM_MIP_MAXTIMECPU" => Compat.@compat(Int32(2006)),
"KTR_PARAM_MIP_MAXTIMEREAL" => Compat.@compat(Int32(2007)),
"KTR_PARAM_MIP_MAXSOLVES" => Compat.@compat(Int32(2008)),
"KTR_PARAM_MIP_INTEGERTOL" => Compat.@compat(Int32(2009)),
"KTR_PARAM_MIP_OUTLEVEL" => Compat.@compat(Int32(2010)),
"KTR_PARAM_MIP_OUTINTERVAL" => Compat.@compat(Int32(2011)),
"KTR_PARAM_MIP_OUTSUB" => Compat.@compat(Int32(2012)),
"KTR_PARAM_MIP_DEBUG" => Compat.@compat(Int32(2013)),
"KTR_PARAM_MIP_IMPLICATNS" => Compat.@compat(Int32(2014)),
"KTR_PARAM_MIP_GUB_BRANCH" => Compat.@compat(Int32(2015)),
"KTR_PARAM_MIP_KNAPSACK" => Compat.@compat(Int32(2016)),
"KTR_PARAM_MIP_ROUNDING" => Compat.@compat(Int32(2017)),
"KTR_PARAM_MIP_ROOTALG" => Compat.@compat(Int32(2018)),
"KTR_PARAM_MIP_LPALG" => Compat.@compat(Int32(2019)),
"KTR_PARAM_MIP_TERMINATE" => Compat.@compat(Int32(2020)),
"KTR_PARAM_MIP_MAXNODES" => Compat.@compat(Int32(2021)),
"KTR_PARAM_MIP_HEURISTIC" => Compat.@compat(Int32(2022)),
"KTR_PARAM_MIP_HEUR_MAXIT" => Compat.@compat(Int32(2023)),
"KTR_PARAM_MIP_HEUR_MAXTIMECPU" => Compat.@compat(Int32(2024)),
"KTR_PARAM_MIP_HEUR_MAXTIMEREAL" => Compat.@compat(Int32(2025)),
"KTR_PARAM_MIP_PSEUDOINIT" => Compat.@compat(Int32(2026)),
"KTR_PARAM_MIP_STRONG_MAXIT" => Compat.@compat(Int32(2027)),
"KTR_PARAM_MIP_STRONG_CANDLIM" => Compat.@compat(Int32(2028)),
"KTR_PARAM_MIP_STRONG_LEVEL" => Compat.@compat(Int32(2029)),
"KTR_PARAM_PAR_NUMTHREADS" => Compat.@compat(Int32(3001)),
"KTR_PARAM_PAR_CONCURRENT_EVALS" => Compat.@compat(Int32(3002)),
"KTR_PARAM_PAR_BLASNUMTHREADS" => Compat.@compat(Int32(3003)),
"KTR_PARAM_PAR_LSNUMTHREADS" => Compat.@compat(Int32(3004))
)