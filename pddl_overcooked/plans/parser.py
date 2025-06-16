def parse_action_pairs(filename):
    with open(filename, 'r') as file:
        lines = [line.strip() for line in file if line.strip()]

    action_pairs = []
    for i in range(0, len(lines), 2):
        pair = lines[i:i+2]
        if len(pair) == 2:
            action1 = pair[0].split()[1]  # second element: action name
            action2 = pair[1].split()[1]
            action_pairs.append([action1, action2])
        else:
            print(f"Odd number of lines; skipping last line: {pair}")

    return action_pairs

