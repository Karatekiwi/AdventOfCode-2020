input = open("../../assets/day_18.txt", "r")
data = input.read().split("\n")

def calculate_within_parenthesis(line):
    inner_calculation = []

    # apply calculation within parenthesis
    while line[-1] != "(":
        item = line.pop()
        if part == 1:
            inner_calculation.append(item)
        elif part == 2:
            if item == "+":
                num1 = int(line.pop())
                num2 = int(inner_calculation.pop())
                inner_calculation.append(num1 + num2)
            else:
                inner_calculation.append(item)
    line.pop()

    while len(inner_calculation) >= 3:
        num1 = inner_calculation.pop()
        operation = inner_calculation.pop()
        num2 = inner_calculation.pop()

        if operation == "+":
            inner_calculation.append(int(num1) + int(num2))
        elif operation == "*":
            inner_calculation.append(int(num1) * int(num2))

    line.append(inner_calculation[0])

    return line


def calculate(line):
    stack = []
    line = line.replace(" ", "")
    line = "(" + line + ")"

    for item in line:
        if item == ")":
            stack = calculate_within_parenthesis(stack)
        else:
            stack.append(item)

    return stack[0]


def calculate_advanced(line):
    stack = []
    line = line.replace(" ", "")
    line = "(" + line + ")"

    for item in line:
        if item == ")":
            stack = calculate_within_parenthesis(stack)
        else:
            stack.append(item)

    return stack[0]


part = 1
result = []
for line in data:
    result.append(calculate(line))

print(f"Solution part 1: {sum(result)}")

part = 2
result = []
for line in data:
    result.append(calculate(line))
print(f"Solution part 2: {sum(result)}")
