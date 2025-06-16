from Ingredient import Ingredient
from Item import Item


class Knife(Item):
    def __init__(self):
        super().__init__('knife')

    def interact(self, player):
        if isinstance(player.item, Ingredient):
            if player.item.cut():
                print(f"{player.item.name} has been cut/minced.")
            else:
                print("Item was already cut.")
        else:
            print("There's nothing here I can cut.")

    def toString(self):
        return self.name

