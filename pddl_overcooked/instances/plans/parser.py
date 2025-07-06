def parse_multiagent_actions(filename):
    with open(filename, 'r') as file:
        lines = [line.strip() for line in file if line.strip()]

    rounds = []
    current_round = []

    for line in lines:
        # Extract the actual action (remove timestamp and duration)
        action_part = line.split(":", 1)[1].rsplit("[", 1)[0].strip()

        if action_part.startswith("pass_time"):
            # End of the current round
            if current_round:
                rounds.append(current_round)
                current_round = []
        else:
            # Keep only the action name (first word)
            action_name = action_part.split()[0]
            current_round.append(action_name)

    # If there's an unfinished round at the end
    if current_round:
        rounds.append(current_round)

    num_agents = len(rounds[0]) if rounds else 0

    for r in rounds:
        while len(r) < num_agents:
            r.append("stay")

    # Detect the number of agents from the first round

    return rounds, num_agents


