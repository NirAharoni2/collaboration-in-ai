from overcooked.Player import Player


class Level:
    def __init__(self, name, board_data, player_positions):
        self.name = name
        self.board = board_data
        self.players = [
            Player("cook1", position=player_positions[0]),
            Player("cook1", position=player_positions[1])
        ]

class Levels:
    def __init__(self):

        self.levels = []
        level_data1 = [
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 4), (2, 0), (2, 0)],
            [(2, 1), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 3)],
            [(2, 0), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 5), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]
        ]

        level_data2 = [
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 4), (2, 0), (2, 0)],
            [(2, 1), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 3)],
            [(2, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 5), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]
        ]

        level_dataExample = [
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 4), (2, 0), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 2
            [(2, 5), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 3
            [(2, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]
        level_data4 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (2, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 5), (1, 0), (2, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]

        level_data5 = [
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 4), (2, 0), (2, 0)],
            [(2, 1), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 3)],
            [(2, 0), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 5), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]
        ]
        # Create Level instances
        level1 = Level("Level 1", level_data1, player_positions=[(1, 1), (4, 1)])
        level2 = Level("Level 2", level_data2, player_positions=[(1, 1), (4, 1)])
        level_example = Level("Level Example", level_dataExample, player_positions=[(2, 3), (4, 3)])
        level_4 = Level("Level 4", level_data4, player_positions=[(1, 1), (3, 1)])
        level_5 = Level("Level 5", level_data5, player_positions=[(1, 1), (4, 1)])

        self.levels.append(level1)
        self.levels.append(level2)
        self.levels.append(level_example)
        self.levels.append(level_4)
        self.levels.append(level_5)

    def getLevel(self, i):
        return self.levels[i]