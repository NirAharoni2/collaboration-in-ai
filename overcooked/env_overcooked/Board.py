from .Ingredient import Ingredient
from .Knife import Knife
from .Plate import Plate
from .Tile import Tile
from .Star import Star  # ✅ Make sure Star is imported

class Board:
    def __init__(self, layout, game):  # ✅ Add game reference
        self.height = len(layout)
        self.width = len(layout[0]) if self.height > 0 else 0
        self.grid = [[None for _ in range(self.height)] for _ in range(self.width)]
        self.game = game  # ✅ Store the game instance

        for x in range(self.width):
            for y in range(self.height):
                tile_type, item_code = layout[y][x]
                tile = Tile((x, y), walkable=(tile_type == 1))

                if item_code == 1:
                    tile.item = Knife()
                elif item_code == 2:
                    tile.item = Plate()
                elif item_code == 3:
                    tile.item = Ingredient("lettuce")
                elif item_code == 4:
                    tile.item = Ingredient("tomato")
                elif item_code == 5:
                    tile.item = Star(self.game)  # ✅ Place Star

                self.grid[x][y] = tile

    def get_tile(self, x, y):
        if 0 <= x < self.width and 0 <= y < self.height:
            return self.grid[x][y]
        raise IndexError("Out of bounds.")

    def interact_at(self, x, y, player):
        tile = self.get_tile(x, y)
        tile.interact(player)

    def print_board(self):
        for y in range(self.height):
            row = []
            for x in range(self.width):
                tile = self.grid[x][y]
                if tile.item:
                    row.append(tile.item.name[:3])
                elif tile.walkable:
                    row.append("...")
                else:
                    row.append("###")
            print(" ".join(row))
