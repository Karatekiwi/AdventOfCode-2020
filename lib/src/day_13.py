
filename = "../../assets/day_13.txt"

with open(filename) as file:
    earliest = int(file.readline().strip())
    buses = [int(x) for x in file.readline().split(',') if x != "x"]

next_buses = []
for bus in buses:
    print(earliest % bus)
    earliest_departure = bus + earliest - (earliest % bus)
    next_buses.append(earliest_departure)

best_bus = min(next_buses)
result = (best_bus - earliest) * buses[next_buses.index(best_bus)]

print(f"Solution part 1: {result}")

#print(f"Part 1: {buses[next_bus] * (next_bus_time[next_bus] - earliest)}")


