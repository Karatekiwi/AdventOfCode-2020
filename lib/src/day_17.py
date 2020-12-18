filename = "../../assets/day_17.txt"

with open(filename, 'r') as f:
    lines = [list(line.strip()) for line in f.readlines()]

print(lines)