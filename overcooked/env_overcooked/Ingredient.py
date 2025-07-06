from .Item import Item


class Ingredient(Item):
    def __init__(self, name):
        super().__init__(name)
        self.is_cut = False
        self.is_minced = False

    def cut(self):
        if not self.is_cut:
            self.is_cut = True
            self.name = f"{self.name}"
            return True
        if self.is_cut and self.name == "tomato":
            self.is_minced = True
            return True
        return False

    def interact(self, player):
        if player.item is None:
            player.item = self
            print(f"Picked up {self.name}.")
            # Tell the tile to clear itself — we'll handle this in Tile logic
        else:
            print("You already have something in your hands.")

    def toString(self):
        if self.is_minced:
            return f'minced_{self.name}'
        elif self.is_cut:
            return f'chopped_{self.name}'
        return self.name

