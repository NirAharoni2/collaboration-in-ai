from Item import Item
from Ingredient import Ingredient

class Plate(Item):
    def __init__(self):
        super().__init__('plate')
        self.contents = []

    def add_item(self, item):
        if isinstance(item, Ingredient) and item.is_cut:
            self.contents.append(item)
            return True
        return False

    def interact(self, player):
        if player.item is None:
            player.item = self
            print("Player picked up the plate.")
        elif isinstance(player.item, Ingredient) and player.item.is_cut:
            if self.add_item(player.item):
                print(f"{player.item.name} placed on plate.")
                player.item = None
            else:
                print("Could not add item to plate.")
        else:
            print("You can only place chopped ingredients on the plate.")

    def toString(self):
        if len(self.contents) == 0:
            return self.name
        elif len(self.contents) == 1:
            return f"{self.name}_with_{self.contents[0].toString()}"
        else:
            content_strings = sorted([item.toString() for item in self.contents])
            return f"{self.name}_with_" + "_and_".join(content_strings)
