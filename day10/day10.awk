function sum(_sumarray,_sumlimit, _sumstart, _sumi) {
	for(_sumi=1;_sumi<_sumlimit;_sumi++)  _sumstart +=_sumarray[_sumi]
	return _sumstart
}
	
		
BEGIN { x = 1;cycle = 1 }
/^(addx|noop)/ {
	stack[cycle]=0; cycle++
	if(split($0,a)==2) { stack[cycle]=a[2]; cycle++}
}
END {
	total=0
	for(i=20;i<=220;i+=40) total+=(i*sum(stack,i,x))
	print total
	for(i=1;i<=220;i+=40) {
		for(j=0;j<40;j++)  
			if(j-sum(stack,j+i,x) > -2 && j-sum(stack,j+i,x) <2) {
				printf "X" 
			} else {
				printf " "
			}
		print ""
	}
}