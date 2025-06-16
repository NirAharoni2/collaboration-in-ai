class Actions:
    MOVE_UP = 1
    MOVE_RIGHT = 2
    MOVE_DOWN = 3
    MOVE_LEFT = 4
    INTERACT = 5
    STAY = 6


    @staticmethod
    def perform(action, player, board):
        if action == Actions.STAY:
            pass
            #do nothing
        if action == Actions.MOVE_UP:
            player.move("up", board)
        elif action == Actions.MOVE_RIGHT:
            player.move("right", board)
        elif action == Actions.MOVE_DOWN:
            player.move("down", board)
        elif action == Actions.MOVE_LEFT:
            player.move("left", board)
        elif action == Actions.INTERACT:
            x, y = player.get_facing_tile_position()
            try:
                board.interact_at(x, y, player)
            except IndexError:
                print("No tile to interact with in that direction.")
        else:
            print("Unknown action.")
