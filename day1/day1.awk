#!/bin/sh
function process_elf() { elves++; calaries[elves]=0 }

function init() { elves=1; calories[elves]=0 }	

BEGIN { init() }

/^$/ { process_elf() }

/^[0-9]*/ {
        calories[elves]=calories[elves]+$1
}

END {
        sort(calories); total=0
        for(i=1 ; i<num+1; i++) total=total+calories[elves-i]
        print total
}        
