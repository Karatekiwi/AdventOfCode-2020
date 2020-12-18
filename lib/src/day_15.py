from collections import defaultdict, deque

filename = "../../assets/day_15.txt"


def run_memory_game(numbers, max_turns):
    # pre fill array
    spoken = [0] * max_turns
    turn = 1

    # fill puzzle input
    for num in numbers:
        spoken[num] = turn
        turn += 1


    last_spoken = numbers[-1]
    turn -= 1
    while turn < max_turns:
        curr = turn - spoken[last_spoken]
        #print(f"turn: {turn}, curr: {curr}")
        if curr == turn:
            curr = 0

        spoken[last_spoken] = turn
        last_spoken = curr
        turn += 1

    return curr


numbers = [int(x) for x in open(filename).read().split(",")]

result = run_memory_game(numbers, 2020)
print(f"Solution part 1: {result}")

result = run_memory_game(numbers, 30000000)
print(f"Solution part 2: {result}")
