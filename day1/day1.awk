#!/bin/sh
onetrueawk '
function sort(ARRAY,    elements, temp, i, j) {
        elements=length(ARRAY)-1
        for(i=2; i<=elements; ++i) 
                for(j=i; ARRAY[j-1] > ARRAY[j]; --j) {
                        temp=ARRAY[j]
                        ARRAY[j] = ARRAY[j-1]
                        ARRAY[j-1] = temp
                }
        return
}
BEGIN {
        elves=1
        calories[elves]=0
}
{
        if (length($0) > 0) { 
                calories[elves]=calories[elves]+$1
        } else {
                elves++
                calories[elves]=0
        }
}
END {
        sort(calories)
        total=0
        for(i=1 ; i<num+1; i++) {
                total=total+calories[elves-i]
        }
        print total
}        
' num=$1 $2
