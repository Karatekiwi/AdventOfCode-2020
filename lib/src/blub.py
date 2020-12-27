r = open('../../assets/day_19.txt').read()
input = r.split('\n\n')

# Part 1
ruletext = input[0].splitlines()
rules = {}
for text in ruletext:
    data = text.split(': ')
    id = data[0]
    content = [seq.split(' ') for seq in data[1].split(' | ')]
    rules[id] = content

print(rules)
received = input[1].splitlines()


def check(rules, id, sample, start):
    rule = rules[id]

    if rule[0][0][0] == '"':
        if start < len(sample) and rule[0][0][1] == sample[start]:
            return {start + 1} 
        else:
             return set()
    else:
        #print(f"check num_rule:{id}, example:{sample}, start:{start}")
        endings = set()

        for subrule in rule:
            buffer = {start}
            for part in subrule:
                temp = set()
                for loc in buffer:
                    aloah = check(rules, part, sample, loc)
                    if len(aloah) > 0:
                        temp = aloah
                buffer = temp
            if len(buffer) > 0:
                endings = buffer

        return endings


results = [len(sample) in check(rules, '0', sample, 0) for sample in received]
print(results)
