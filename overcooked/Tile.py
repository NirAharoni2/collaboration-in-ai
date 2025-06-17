from cloudpickle import instance

from Star import Star


class Tile:
    def __init__(self, position, walkable=True):
        self.position = position
        self.walkable = walkable
        self.item = None
        self.occupied = False

    def has_item(self):
        return self.item is not None

    def interact(self, player):
        if self.walkable:
            print("❌ You can't interact with a walkable tile.")
            return

        if self.has_item():
            # Store reference before interaction
            item_before = self.item
            self.item.interact(player)

            # If the item on the tile is now in the player's hands, clear it
            if player.item is item_before:
                self.item = None
        else:
            if player.item:
                self.item = player.item
                player.item = None
                print(f"Placed {self.item.name} on tile.")
            else:
                print("Tile and player are both empty.")


    def toString(self):
        if self.walkable:
            return 'walkable_tile'
        return 'counter_tile'

    def getPath(self):
        return f'images/{self.toString()}.png'