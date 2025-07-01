
import pygame
from actions import Actions
from Game import Game
from pddl_overcooked.plans import parser  # adjust if you renamed it

# Map string actions from plan to Actions enum
action_str_to_enum = {
    "move-north": Actions.MOVE_UP,
    "move-south": Actions.MOVE_DOWN,
    "move-east": Actions.MOVE_RIGHT,
    "move-west": Actions.MOVE_LEFT,
    "pick-item": Actions.INTERACT,
    "put-item": Actions.INTERACT,
    "cut-ingredient": Actions.INTERACT,
    "place-item-on-plate": Actions.INTERACT,
    "stay": Actions.STAY,
}

def convert_action(name):
    return action_str_to_enum.get(name, Actions.STAY)

def main():
    # Load parsed actions
<<<<<<< Updated upstream
    plan = r"C:\studies\github\collaboration-in-ai\pddl_overcooked\plans\plan1_problem1.pddl"
=======
    plan = r"C:\studies\github\collaboration-in-ai\pddl_overcooked\plans\plan1_problem8.pddl"
>>>>>>> Stashed changes

    actions_raw = parser.parse_action_pairs(plan)
    actions = [(convert_action(a1), convert_action(a2)) for a1, a2 in actions_raw]

    game = Game(4)
    game.render()
    clock = pygame.time.Clock()

    step_index = 0
    running = True

    while running and step_index < len(actions):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
        print(f"{step_index}: {actions[step_index]}")
        action1, action2 = actions[step_index]
        game.game_step((action1, action2))
        step_index += 1

        game.render()
        clock.tick(2)  # Run 2 steps per second (adjust speed as needed)


if __name__ == "__main__":
    main()
