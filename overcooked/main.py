import pygame
from actions import Actions
from Game import Game  # Make sure your Game class is in Game.py or equivalent
def main():
    game = Game()
    running = True
    clock = pygame.time.Clock()

    key_map_player1 = {
        pygame.K_w: Actions.MOVE_UP,
        pygame.K_s: Actions.MOVE_DOWN,
        pygame.K_a: Actions.MOVE_LEFT,
        pygame.K_d: Actions.MOVE_RIGHT,
        pygame.K_e: Actions.INTERACT,
    }

    key_map_player2 = {
        pygame.K_UP: Actions.MOVE_UP,
        pygame.K_DOWN: Actions.MOVE_DOWN,
        pygame.K_LEFT: Actions.MOVE_LEFT,
        pygame.K_RIGHT: Actions.MOVE_RIGHT,
        pygame.K_RETURN: Actions.INTERACT,
    }

    while running:
        action1 = Actions.STAY
        action2 = Actions.STAY
        stepped = False  # To ensure game_step is only called once per input event

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False

            elif event.type == pygame.KEYDOWN:
                if event.key in key_map_player1:
                    action1 = key_map_player1[event.key]
                    stepped = True
                if event.key in key_map_player2:
                    action2 = key_map_player2[event.key]
                    stepped = True

        if stepped:
            game.game_step((action1, action2))

        game.render()
        clock.tick(120)  # Smooth rendering at 120 FPS, logic only steps on input

    pygame.quit()

if __name__ == "__main__":
    main()