SHELL := /bin/sh
AWK := $(shell which onetrueawk)

default:
	@echo "Advent of Code 2022 - One True Awk"
	@echo "one true awk location =" $(AWK)

.PHONY:all
all: output/day1 output/day2 output/day3 output/day4

.PHONY: day1-test day1
day1-test:
	@$(AWK) -f ./lib/utils.awk -f ./day1/day1.awk -v num=1 day1/input_test
	@$(AWK) -f ./lib/utils.awk -f ./day1/day1.awk -v num=3 day1/input_test
day1:
	@$(AWK) -f ./lib/utils.awk -f ./day1/day1.awk -v num=1 day1/input
	@$(AWK) -f ./lib/utils.awk -f ./day1/day1.awk -v num=3 day1/input
output/day1: day1/day1.awk day1/input
	@$(AWK) -f ./lib/utils.awk -f ./day1/day1.awk -v num=1 day1/input > output/day1
	@$(AWK) -f ./lib/utils.awk -f ./day1/day1.awk -v num=3 day1/input >> output/day1

.PHONY: day2-test day2
day2-test:
	@$(AWK) -f ./lib/utils.awk -f ./day2/day2.awk day2/input_test
day2:
	@$(AWK) -f ./lib/utils.awk -f ./day2/day2.awk day2/input
output/day2: day2/day2.awk day2/input
	@$(AWK) -f ./lib/utils.awk -f ./day2/day2.awk day2/input > output/day2

.PHONY: day3-test day3
day3-test:
	@$(AWK) -f ./lib/utils.awk -f ./day3/day3.awk day3/input_test
day3:
	@$(AWK) -f ./lib/utils.awk -f ./day3/day3.awk day3/input
output/day3: day3/day3.awk day3/input
	@$(AWK) -f ./lib/utils.awk -f ./day3/day3.awk day3/input > output/day3

.PHONY: day4-test day4
day4-test:
	@$(AWK) -f ./lib/utils.awk -f ./day4/day4.awk day4/input_test
day4:
	@$(AWK) -f ./lib/utils.awk -f ./day4/day4.awk day4/input
output/day4: day4/day4.awk day4/input
	@$(AWK) -f ./lib/utils.awk -f ./day4/day4.awk day4/input > output/day4

.PHONY: day5-test day5
day5-test:
	@$(AWK) -f ./lib/utils.awk -f ./day5/day5.awk day5/input_test
day5:
	@$(AWK) -f ./lib/utils.awk -f ./day5/day5.awk day5/input
output/day5: day5/day5.awk day5/input
	@$(AWK) -f ./lib/utils.awk -f ./day5/day5.awk day5/input > output/day5

.PHONY: push
push:
	@git push -u origin trunk
