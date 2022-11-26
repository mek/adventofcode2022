#!/bin/sh
onetrueawk '
BEGIN {
	print "Advent of Code - Day 4 - One True Awk"
	lines = 0 
	covered = 0 
	nooverlap = 0 
	
}
/^#/ {
	print substr($0,2)
}
/^[0-9][0-9\-,]*/ {
	lines++;
	split($0,elves,","); 
	split(elves[1],elf1,"-") ; split(elves[2],elf2,"-")
        if ((elf1[1] >= elf2[1] && elf1[2] <= elf2[2]) || 
            ( elf2[1] >= elf1[1] && elf2[2] <= elf1[2]))  
		covered++
	if (( elf1[1] < elf2[1] && elf1[2] < elf2[1]) || 
	    ( elf1[1] > elf2[2] && elf1[2] > elf2[2])) 
		nooverlap++
}
END {
	print covered
	print lines - nooverlap
	print "Done - Advent of Code - Day 4 - One True Awk"
}
' $1
	
