import pygame
from overcooked.env_overcooked.actions import Actions
from .Board import Board
from overcooked.env_overcooked.Level import Levels


class Game:
    def __init__(self, level_id, tile_size=80, ):
        pygame.init()
        self.tile_size = tile_size

        # Define the level layout
        levels = Levels()
        level = levels.getLevel(level_id)
        self.board = Board(level.board, self)
        self.players = level.players
        for player in self.players:
            x, y = player.position
            self.board.get_tile(x, y).occupied = True

        self.width = self.board.width * self.tile_size
        self.height = self.board.height * self.tile_size

        self.screen = pygame.display.set_mode((self.width, self.height))
        pygame.display.set_caption("Overcooked Clone")

        self.clock = pygame.time.Clock()
        self.has_won = False

    def win(self):
        self.has_won = True
        print("🎉 WIN CONDITION REACHED!")

    def game_step(self, actions):
        for i, action in enumerate(actions):
            Actions.perform(action, self.players[i], self.board)

    def render(self):
        self.screen.fill((0, 0, 0))  # Clear screen

        for x in range(self.board.width):
            for y in range(self.board.height):
                tile = self.board.get_tile(x, y)
                tile_x = x * self.tile_size
                tile_y = y * self.tile_size

                # Draw tile
                tile_image = pygame.image.load(f"overcooked/{tile.getPath()}").convert_alpha()
                tile_image = pygame.transform.scale(tile_image, (self.tile_size, self.tile_size))
                self.screen.blit(tile_image, (tile_x, tile_y))

                # Draw item on tile (if any)
                if tile.item:
                    item_image = pygame.image.load(f"overcooked/{tile.item.getPath()}").convert_alpha()
                    item_image = pygame.transform.scale(item_image, (self.tile_size, self.tile_size))
                    self.screen.blit(item_image, (tile_x, tile_y))

        # Draw players
        for player in self.players:
            px, py = player.position
            player_image = pygame.image.load(f"overcooked/{player.getPath()}").convert_alpha()
            player_image = pygame.transform.scale(player_image, (self.tile_size, self.tile_size))
            self.screen.blit(player_image, (px * self.tile_size, py * self.tile_size))

        if self.has_won:
            self.render_win()

        pygame.display.flip()
        self.clock.tick(60)  # Limit to 60 FPS


    def render_win(self):
        # Big star overlay
        font = pygame.font.SysFont(None, 100)
        text = font.render("YOU WIN!", True, (255, 255, 0))  # Yellow text
        text_rect = text.get_rect(center=(self.width // 2, self.height // 2))
        self.screen.blit(text, text_rect)

        # Optional: draw big star image overlay
        star_image = pygame.image.load("overcooked/images/star.png").convert_alpha()
        star_image = pygame.transform.scale(star_image, (150, 150))
        star_rect = star_image.get_rect(center=(self.width // 2, self.height // 2 - 100))
        self.screen.blit(star_image, star_rect)

    def run_once(self, actions):
        self.game_step(actions)
        self.render()

    def quit(self):
        pygame.quit()
