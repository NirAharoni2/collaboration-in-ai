import sys

import pygame

from overcooked.env_overcooked.actions import Actions
from overcooked.env_overcooked.Game import Game
from pddl_overcooked.instances.plans import parser



def start(level_id, plan_path):
    # Load parsed actions
    plan = plan_path

    actions_raw, num_agents = parser.parse_multiagent_actions(plan)
    actions = [tuple(Actions.convert_action(a) for a in round_actions) for round_actions in actions_raw]

    game = Game(level_id)
    game.render()
    clock = pygame.time.Clock()

    step_index = 0
    running = True

    while running and step_index < len(actions):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
        print(f"{step_index}: {actions[step_index]}")
        game.game_step(actions[step_index])
        step_index += 1

        game.render()
        clock.tick(2)  # Run 2 steps per second (adjust speed as needed)

def main(level_id):
    level_id = int(level_id)
    plan_path = rf"C:\studies\github\collaboration-in-ai\pddl_overcooked\instances\plans\plan1_problem{level_id}.pddl"
    start(level_id, plan_path)

if __name__ == "__main__":
    if len(sys.argv) < 2 or '-h' in sys.argv:
        print("Usage: python-m overcooked.main.py <level_id>")
        exit(1)

    main(sys.argv[1])