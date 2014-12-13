#!/bin/sh
(echo Time,Ping; cat pinglog | sed -rn 's/^\[([^]]+)\].*time=(..\..).*$/\1,\2/gp') | Rscript pingplot.r $1
