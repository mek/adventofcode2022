#!/bin/sh
function getvalue(_char, _getvalue_i) {
	_getvalue_i = ordn(_char)
	if(_getvalue_i >= 65 &&  _getvalue_i <= 95)
		return _getvalue_i - 38
	if(_getvalue_i >= 97 &&  _getvalue_1 <=122)
		return _getvalue_i - 96
	return 0
}
BEGIN { 
	ord_init() 
	total = 0
	linecount=0
	prisum=0
}
/^#/ { 
	print substr($0,2)
	next
} 
/^[a-zA-Z]?/ {
	if(length($0) % 2 != 0) {
		print "error in line " NR ", uneven number of strings"
		exit
	}
	rmdup($0)
	linecount++
	split(substr($0,1,length($0)/2),a,"")
	split(substr($0,1+length($0)/2),b,"")
	for(i=1;i<length(rmdup($0))+1;i++) 
		rucksackitems[substr(rmdup($0),i,1)]++
	if(linecount % 3 == 0) {
		for(i in rucksackitems) 
			if(rucksackitems[i]==3)
				prisum=prisum+getvalue(i)
		delete rucksackitems
	}
	for(i in a) for(j in b) if(a[i]==b[j]) {
		total=total + getvalue(a[i])
		next
	}
}
END {
	print linecount
	print total
	print prisum	
}
