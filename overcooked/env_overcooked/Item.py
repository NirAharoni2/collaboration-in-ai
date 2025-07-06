class Item:
    def __init__(self, name):
        self.name = name

    def interact(self, player):
        # Default item behavior: do nothing
        print(f"Nothing happens with {self.name}.")


    def toString(self):
        # Default item behavior: do nothing
        print(f"Nothing happens with {self.name}.")

    def getPath(self):
        return f'images/{self.toString()}.png'