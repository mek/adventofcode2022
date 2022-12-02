#!/bin/sh
onetrueawk '
function score(ME,OPP,	x,y) {
	x = v[ME]
	if(ME=="Paper") {
		if(OPP=="Scissor") x = x +  0
		if(OPP=="Paper")   x = x +  3
		if(OPP=="Rock")    x = x +  6
	}
	if(ME=="Rock") {
		if(OPP=="Paper")   x = x +  0
		if(OPP=="Rock")    x = x +  3
		if(OPP=="Scissor") x = x +  6
	}
	if(ME=="Scissor") {
		if(OPP=="Rock")    x = x +  0
		if(OPP=="Scissor") x = x +  3
		if(OPP=="Paper")   x = x +  6
	}
	return x
}
function choose(OPP,RESULT,	x,y) {
	if(t[OPP]=="Paper") {
		if(RESULT=="X") x = "Rock"
		if(RESULT=="Y") x = "Paper"
		if(RESULT=="Z") x = "Scissor"
	}
	if(t[OPP]=="Rock") {
		if(RESULT=="X") x = "Scissor"
		if(RESULT=="Y") x = "Rock"
		if(RESULT=="Z") x = "Paper"
	}
	if(t[OPP]=="Scissor") {
		if(RESULT=="X") x = "Paper"
		if(RESULT=="Y") x = "Scissor"
		if(RESULT=="Z") x = "Rock"
	}
	return score(x,t[OPP])
}

BEGIN {
	v["Rock"] = 1; v["Paper"] = 2; v["Scissor"] = 3
	t["A"] = "Rock"   ; t["X"] = "Rock"
	t["B"] = "Paper"  ; t["Y"] = "Paper"
	t["C"] = "Scissor"; t["Z"] = "Scissor"
}
{
	if (NF!=2) {
		print "Line " NR " has bad input"
		exit
	}

	me = t[$2]; opp = t[$1]
	total["me"]     = total["me"]     + score(me,opp)
	total["opp"]    = total["opp"]    + score(opp,me)
	total["choose"] = total["choose"] + choose($1,$2)
}
END {
	for(i in total) printf "who:%s:score:%d\n",i,total[i]
}
' $1
