class Player:
    def __init__(self, name, position=(0, 0)):
        self.name = name
        self.item = None
        self.position = position
        self.facing = "down"  # default direction

    def move(self, direction, board):
        self.facing = direction  # update facing
        x, y = self.position
        dx, dy = {
            "up": (0, -1),
            "down": (0, 1),
            "left": (-1, 0),
            "right": (1, 0)
        }.get(direction, (0, 0))

        new_x, new_y = x + dx, y + dy

        try:
            target_tile = board.get_tile(new_x, new_y)
            current_tile = board.get_tile(x, y)

            if target_tile.walkable and not target_tile.occupied:
                # Update occupation
                current_tile.occupied = False
                target_tile.occupied = True

                self.position = (new_x, new_y)
                print(f"{self.name} moved to {self.position} facing {self.facing}")
            else:
                print("Can't move there — blocked or occupied.")
        except IndexError:
            print("Can't move there — out of bounds.")

    def get_facing_tile_position(self):
        x, y = self.position
        dx, dy = {
            "up": (0, -1),
            "down": (0, 1),
            "left": (-1, 0),
            "right": (1, 0)
        }.get(self.facing, (0, 0))
        return x + dx, y + dy

    def toString(self):
        if self.item:
            return f'{self.name}_with_{self.item.toString()}'
        return f'{self.name}'

    def getPath(self):
        return f'images/{self.toString()}.png'