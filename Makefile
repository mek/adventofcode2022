default:
	@echo "Advent of Code 2022 - True Awk"

output/day1: day1/day1.awk day1/input
	@./day1/day1.awk 1 day1/input > output/day1
	@./day1/day1.awk 3 day1/input >> output/day1
