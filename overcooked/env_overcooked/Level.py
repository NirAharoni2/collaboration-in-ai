from overcooked.env_overcooked.Player import Player


class Level:
    def __init__(self, name, board_data, player_positions):
        self.name = name
        self.board = board_data
        self.players = []
        for player_position in player_positions:
            self.players.append(Player("cook1", position=player_position))

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
            [(2, 1), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 3)],
            [(2, 0), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 5), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (1, 0), (1, 0), (2, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]
        ]

        '''level_data11 = [
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 4), (2, 0), (2, 0)],
            [(2, 1), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 3)],
            [(2, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 5), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (1, 0), (1, 0), (1, 0), (1, 0), (1, 0), (2, 0)],
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]
        ]'''

        level_data3 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (2, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 5), (1, 0), (2, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]

        level_data4 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (2, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 5), (1, 0), (2, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]

        level_data5 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (2, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 0), (2, 0), (2, 0), (2, 0), (2, 0)],  # Row 4
            [(2, 5), (1, 0), (2, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]
        level_data6 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (1, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 0), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 5), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]
        level_data7 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (1, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 0), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 5), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]
        level_data8 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (1, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 0), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 5), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]
        level_data9 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (1, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 0), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 5), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]
        level_data10 = [
            [(2, 0), (2, 0), (2, 0), (2, 4), (2, 0)],  # Row 0
            [(2, 1), (1, 0), (1, 0), (1, 0), (2, 3)],  # Row 1
            [(2, 0), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 5), (1, 0), (1, 0), (1, 0), (2, 0)],  # Row 4
            [(2, 0), (2, 0), (2, 0), (2, 2), (2, 0)]  # Row 5
        ]
        # Create Level instances
        level_example = Level("Level Example", level_data1, player_positions=[(2, 3), (4, 3)])
        level_1 = Level("Level 1", level_data1, player_positions=[(1, 1), (4, 1)])
        level_2 = Level("Level 2", level_data2, player_positions=[(1, 1), (4, 1), (4, 3)])
        level_3 = Level("Level 3", level_data3, player_positions=[(1, 1), (3, 1)])
        level_4 = Level("Level 4", level_data4, player_positions=[(1, 1), (3, 1), (3,2)])
        level_5 = Level("Level 5", level_data5, player_positions=[(1, 1), (3, 1), (3,3), (1, 3)])
        level_6 = Level("Level 6", level_data6, player_positions=[(1, 1)])
        level_7 = Level("Level 7", level_data7, player_positions=[(1, 1), (3,1)])
        level_8 = Level("Level 8", level_data8, player_positions=[(1, 1), (3,1), (3,3)])
        level_9 = Level("Level 9", level_data9, player_positions=[(1, 1), (3,1), (3,3), (1, 3)])
        level_10 = Level("Level 10", level_data10, player_positions=[(1, 1), (3,1)])

        self.levels.append(level_example)

        self.levels.append(level_1)
        self.levels.append(level_2)
        self.levels.append(level_3)
        self.levels.append(level_4)
        self.levels.append(level_5)
        self.levels.append(level_6)
        self.levels.append(level_7)
        self.levels.append(level_8)
        self.levels.append(level_9)
        self.levels.append(level_10)

    def getLevel(self, i):
        return self.levels[i]