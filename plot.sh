#!/bin/bash
set terminal pngcairo size 1280,720 enhanced
set output "exe-time.png"
set title "Temps d'éxécution en fonction du programme de tri et du nombre d'éléments à triés"
set ylabel "Temps d'éxécution"
set xlabel "Nombre d'éléments"
set grid
#plot [:4000][:5] "test/average_bubble.dat" w lp title 'Bubble' lc rgb 'black', "test/average_insertion.dat" w lp title 'Insertion' lc rgb 'red'

plot "average_bubble.dat" using 2:1 w lp title 'Bubble' lc rgb 'black', "average_insertion.dat" using 2:1 w lp title 'Insertion' lc rgb 'blue', "average_insertion_star.dat" using 2:1 w lp title 'Insertion_star' lc rgb 'red', "average_selection.dat" using 2:1 w lp title 'Selection' lc rgb 'green'