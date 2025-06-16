from Item import Item
from Plate import Plate


class Star(Item):
    def __init__(self, game):
        super().__init__('star')
        self.game = game  # Store reference to the Game instance

    def interact(self, player):
        if isinstance(player.item, Plate):
            ingredient_names = [item.toString() for item in player.item.contents]

            if "chopped_tomato" in ingredient_names and "chopped_lettuce" in ingredient_names:
                print("✅ You delivered the salad! You win!")
                player.item = None
                self.game.win()  # <-- Triggers the win state
                return
            if "minced_tomato" in ingredient_names:
                print("✅ You delivered the salad! You win!")
                player.item = None
                self.game.win()  # <-- Triggers the win state
                return
            else:
                print("❌ The plate doesn't have the right ingredients.")
        else:
            print("❌ You need to bring a plate with the salad.")

    def toString(self):
        return self.name
