SHELL := /bin/sh
default:
	@echo "Advent of Code 2022 - One True Awk"

output/day1: day1/day1.awk day1/input
	@./day1/day1.awk 1 day1/input > output/day1
	@./day1/day1.awk 3 day1/input >> output/day1

output/day2: day2/day2.awk day2/input
	@./day2/day2.awk day2/input > output/day2

.PHONY: push
push:
	@git push -u origin trunk
