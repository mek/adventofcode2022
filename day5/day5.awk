BEGIN {
	print "Start - Advent of Code - Day 5 - One True Awk"
}

/^#/ { print substr($0,2); getline }

END {
	print "Done  - Advent of Code - Day 5 - One True Awk"
}
