#!/bin/sh
(echo "Time,Ping"; cat pinglog | sed -rn 's/^\[([^]]{10,})\].*time=(..\..).*$/\1,\2/gp') | Rscript pingplot.r $1
