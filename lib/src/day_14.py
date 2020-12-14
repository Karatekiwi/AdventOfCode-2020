import re

def use_mask(mask, value):
    result = ""
    value_as_dec = format(int(value), "036b")
    for x, y in zip(mask, value_as_dec):
        if x == "X":
            result += y
        else:
            result += x

    return result


def replace(string, position, character):
    return string[:position] + character + string[position+1:]


def use_mask_2(mask, value):
    result = ""
    value_as_dec = format(int(value), "036b")
    #print(f"v: {value_as_dec}")
    #print(f"m: {"".join(list(mask))}")
    for x, y in zip(mask, value_as_dec):
        if x == "0":
            result += y
        elif x == "1":
            result += "1"
        elif x == "X":
            result += "X"
        else:
            result += y

    possibilities = [result]
    #print(possibilities)

    # handle floating values
    for floating in range(result.count("X")):
        combinations = []
        for poss in possibilities:
            index_x = poss.find("X")
            combinations.append(replace(poss, index_x, "0"))
            combinations.append(replace(poss, index_x, "1"))
        possibilities = combinations
        #print(possibilities)

    return possibilities


memory = {}

filename = "../../assets/day_14.txt"

addr_pattern = re.compile(r"mem\[(\d+)\]")

instructions = [i.split(" = ") for i in open(filename).read().splitlines()]

for instruction, value in instructions:
    if instruction == "mask":
        mask = list(value)
        #print(f"{mask} = {value}")

    else:
        addr = addr_pattern.findall(instruction)[0]
        new_value = use_mask(mask, value)
        memory[addr] = int(new_value, 2)  # dec to int
        #print(f"{addr} = {memory[addr]}")

result = sum(memory.values())
print(f"Solution part 1: {result}")

memory = {}

for instruction, value in instructions:
    if instruction == "mask":
        mask = list(value)
        #print(f"{mask} = {value}")

    else:
        addr = addr_pattern.findall(instruction)[0]

        # this time we use the mask on the addr value
        new_addrs = use_mask_2(mask, addr)
        for new_addr in new_addrs:
            memory[int(new_addr, 2)] = int(value)

        #print(f"r: {new_addrs}")

#print(memory)
result = sum(memory.values())
print(f"Solution part 2: {result}")
