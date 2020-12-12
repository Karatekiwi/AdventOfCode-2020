import math

# ship position
ship_x = 0
ship_y = 0

orientations = {'N', 'E', 'S', 'W'}
# index of orientations
facing = 1

filename = "../../assets/day_12.txt"
instructions = [(x[0], int(x[1:])) for x in open(filename)]


def move_forwards_1(value):
    global ship_x, ship_y

    # facing 0: north, 1: east, 2: south, 3: west
    if facing == 0:
        ship_y += value
    elif facing == 1:
        ship_x += value
    elif facing == 2:
        ship_y -= value
    elif facing == 3:
        ship_x -= value


def move_forwards_2(value):
    global ship_x, ship_y, waypoint_x, waypoint_y
    ship_y += waypoint_y*value
    ship_x += waypoint_x*value
    # print(f"{x} {y}")


def changeFacing(action, value):
    global facing

    numTurn = value / 90
    if (action == "R"):
        facing = (facing + numTurn) % 4
    elif (action == "L"):
        facing = (facing - numTurn) % 4


def rotate(action, value):
    global waypoint_x, waypoint_y

    # number of rotations
    numTurn = int((value / 90) % 4)
    if (action == "R"):
        for _ in range(numTurn):
            new_x = waypoint_y
            new_y = waypoint_x * -1
            waypoint_x = new_x
            waypoint_y = new_y
    if (action == "L"):
        for _ in range(numTurn):
            new_x = waypoint_y * -1
            new_y = waypoint_x
            waypoint_x = new_x
            waypoint_y = new_y


def move_part_1():
    global ship_x, ship_y
    for line in instructions:
        action = line[0]
        value = line[1]

        if action == "N":
            ship_y += value
        elif action == "S":
            ship_y -= value
        elif action == "E":
            ship_x += value
        elif action == "W":
            ship_x -= value

        elif action == "R" or action == "L":
            changeFacing(action, value)

        elif action == "F":
            move_forwards_1(value)
        # print(f"action:{action}{value}, facing:{facing}, current:{x},{y}")


def move_part_2():
    global waypoint_x, waypoint_y
    for line in instructions:
        action = line[0]
        value = line[1]

        if action == "N":
            waypoint_y += value
        elif action == "S":
            waypoint_y -= value
        elif action == "E":
            waypoint_x += value
        elif action == "W":
            waypoint_x -= value

        elif action == "R" or action == "L":
            rotate(action, value)

        elif action == "F":
            move_forwards_2(value)
        #print(f"action:{action}{value}, facing:{facing}, ship:{x},{y}, waypoint:{waypointX},{waypointY}")


move_part_1()
distance_1 = abs(ship_x) + abs(ship_y)
print(f"Solution part 1: {distance_1}")

# ship position -> reset
ship_x = 0
ship_y = 0

# waypoint position
waypoint_x = 10
waypoint_y = 1

move_part_2()
distance_2 = abs(ship_x) + abs(ship_y)
print(f"Solution part 2: {distance_2}")
