from copy import deepcopy


def count_adjacent_occupied(grid, i, j):
    count = 0
    for x in range(i-1, i+2):
        for y in range(j-1, j+2):
            if i == x and j == y:
                continue

            # negative values start at the back of the array...
            if x < 0 or y < 0:
                continue

            try:
                seat = grid[y][x]
                if seat == "#":
                    count += 1
            except IndexError:
                pass

    return count


def seat_people(grid):
    changeHappened = False

    new_seating = deepcopy(grid)

    for j, row in enumerate(grid):
        for i, seat in enumerate(row):
            if seat == ".":
                continue

            numOccupied = count_adjacent_occupied(grid, i, j)

            if numOccupied == 0:
                if seat == "L":
                    changeHappened = True
                    new_seating[j][i] = "#"
            elif numOccupied >= 4:
                if seat == "#":
                    changeHappened = True
                    new_seating[j][i] = "L"

    if not changeHappened:
        return new_seating

    return seat_people(new_seating)


def print_grid(toPrint):
    for i in range(len(toPrint)):
        print(toPrint[i])


def count_occupied(grid):
    return sum([seat == '#' for row in grid for seat in row])


def count_adjacent_occupied_2(grid, i, j):
    count = 0
    for direction in directions:
        x = i + direction[0]
        y = j + direction[1]

        while True:
            if x < 0 or y  < 0 or x >= total_length or y >= grid_length:
                break

            if grid[y][x] == "L":
                break
            elif grid[y][x] == "#":
                count += 1
                break
            else:
                x += direction[0]
                y += direction[1]

    return count


def seat_people_part2(grid):
    changeHappened = False

    new_seating = deepcopy(grid)

    for j, row in enumerate(grid):
        for i, seat in enumerate(row):
            if seat == ".":
                continue

            numOccupied = count_adjacent_occupied_2(grid, i, j)

            if numOccupied == 0:
                if seat == "L":
                    changeHappened = True
                    new_seating[j][i] = "#"
            elif numOccupied >= 5:
                if seat == "#":
                    changeHappened = True
                    new_seating[j][i] = "L"

    if not changeHappened:
        return new_seating

    return seat_people_part2(new_seating)


filename = "../../assets/day_11.txt"

a = open(filename).read().split("\n")[:-1]

seats = [[s for s in x] for x in a]

result = seat_people(seats)
print(f"Solution part 1 : {count_occupied(result)}")

directions = [(-1, -1), (1, -1), (0, -1), (-1, 0),
              (1, 0), (-1, 1), (0, 1), (1, 1)]

grid_length = len(seats)
total_length = len(seats[0])
result2 = seat_people_part2(seats)
print(f"Solution part 2 : {count_occupied(result2)}")
