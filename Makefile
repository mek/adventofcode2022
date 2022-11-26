SHELL := /bin/sh
default:
	@echo "Advent of Code 2022 - One True Awk"
.PHONY:all
all: output/day1 output/day2 output/day3 output/day4

output/day1: day1/day1.awk day1/input
	@./day1/day1.awk 1 day1/input > output/day1
	@./day1/day1.awk 3 day1/input >> output/day1

output/day2: day2/day2.awk day2/input
	@./day2/day2.awk day2/input > output/day2

output/day3: day3/day3.awk day3/input
	@./day3/day3.awk day3/input > output/day3

output/day4: day4/day4.awk day4/input
	@./day4/day4.awk day4/input > output/day4

.PHONY: push
push:
	@git push -u origin trunk
