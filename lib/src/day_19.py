input = open("../../assets/day_19.txt", "r")
data = input.read().split("\n\n")


ruleset = data[0]
messages = data[1]

rules = {}


def compute_rules():
    for rule in ruleset.split("\n"):
        rule_num = int(rule.split(": ")[0])
        options = rule.split(": ")[1].split(" ")
        if "|" in options:
            split_index = options.index("|")
            poss = []
            poss.append(options[0: split_index])
            poss.append(options[split_index+1: len(options)])
            rules[rule_num] = poss
        else:
            if len(options) > 1:
                rules[rule_num] = [options]
            else:
                # clean up letters
                options = options[0].replace("\"", "")
                if (options.isnumeric()):
                    rules[rule_num] = [[options]]
                else:
                    rules[rule_num] = options


compute_rules()


def check(num_rule, message, index):
    rule = rules[num_rule]

    if type(rule) is str:
        letter = rules[num_rule]
        if index < len(message) and letter == message[index]:
            return {index + 1}
        else:
            return set()
    else:
        #print(f"check num_rule:{num_rule}, message:{message}, start:{start}")
        result = set()
        for subrule in rule:
            buff = {index}
            for part in subrule:
                temp = set()
                for loc in buff:
                    part = int(part)
                    #print(f"next up: {part}")
                    compute = check(part, message, loc)
                    if len(compute) > 0:
                        temp = compute
                buff = temp
            if len(buff) > 0:
                result = buff

        return result


#print(rules)
matches = 0
for message in messages.splitlines():
    x = check(0, message, 0)
    if len(message) in x:
        matches += 1

print(f"Solution part 1: {matches}")
