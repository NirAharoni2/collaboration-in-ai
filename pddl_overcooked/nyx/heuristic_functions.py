from winreg import error

from syntax.state import State
import syntax.constants as constants

def heuristic_function(state):
    state = state.state_vars
    if constants.CUSTOM_HEURISTIC_ID == 1:
        import math
        num_agents = int(state.get("['number-of-agents']", 2))  # fallback to 2 if missing

        def manhattan(a, b):
            return abs(a[0] - b[0]) + abs(a[1] - b[1])

        STAR = (3, 0)
        BOARD = (1, 0)
        board_size = (5, 5)

        # Base state checks
        is_minced_tomato = state.get("['minced', 'tomato1']", False)
        is_tomato_on_plate = state.get("['on', 'tomato1', 'plate1']", False)
        is_lettuce_on_plate = state.get("['on', 'lettuce1', 'plate1']", False)
        is_plate_submitted = state.get("['submitted', 'plate1']", False)

        if is_minced_tomato:
            return 1000

        if is_plate_submitted and is_tomato_on_plate and is_lettuce_on_plate:
            return 0

        if is_plate_submitted:
            return 1000

        plate1_loc = None
        lettuce_loc = None
        tomato_loc = None
        cook_locs = {}

        # Scan tiles for item locations
        for i in range(board_size[0]):
            for j in range(board_size[1]):
                tile = f"tile-{i}-{j}"
                if state.get(f"['at-item', 'plate1', '{tile}']"):
                    plate1_loc = (i, j)
                if state.get(f"['at-item', 'tomato1', '{tile}']"):
                    tomato_loc = (i, j)
                if state.get(f"['at-item', 'lettuce1', '{tile}']"):
                    lettuce_loc = (i, j)
                for agent_id in range(num_agents):
                    cook_name = f'cook{agent_id+1}'
                    if state.get(f"['at', '{cook_name}', '{tile}']"):
                        cook_locs[cook_name] = (i, j)

        # If held, update item locations to the cook's location
        for cook, pos in cook_locs.items():
            if state.get(f"['has', '{cook}', 'lettuce1']"):
                lettuce_loc = pos
            if state.get(f"['has', '{cook}', 'tomato1']"):
                tomato_loc = pos
            if state.get(f"['has', '{cook}', 'plate1']"):
                plate1_loc = pos

        total_cost = 0

        lettuce_cut = state.get("['cut', 'lettuce1']", False)
        tomato_cut = state.get("['cut', 'tomato1']", False)

        # --- LETTUCE ---
        if not lettuce_cut and lettuce_loc:
            total_cost += min(
                manhattan(cook_locs[c], lettuce_loc) + manhattan(lettuce_loc, BOARD) + 1
                for c in cook_locs
            )
        if not is_lettuce_on_plate and lettuce_loc and plate1_loc:
            total_cost += min(
                manhattan(cook_locs[c], lettuce_loc) + manhattan(lettuce_loc, plate1_loc) + 1
                for c in cook_locs
            )

        # --- TOMATO ---
        if not tomato_cut and tomato_loc:
            total_cost += min(
                manhattan(cook_locs[c], tomato_loc) + manhattan(tomato_loc, BOARD) + 1
                for c in cook_locs
            )
        if not is_tomato_on_plate and tomato_loc and plate1_loc:
            total_cost += min(
                manhattan(cook_locs[c], tomato_loc) + manhattan(tomato_loc, plate1_loc) + 1
                for c in cook_locs
            )

        # --- SUBMISSION ---
        if not is_plate_submitted and plate1_loc:
            total_cost += min(
                manhattan(plate1_loc, STAR) + 1,
                min(
                    manhattan(cook_locs[c], plate1_loc) + manhattan(plate1_loc, STAR) + 1
                    for c in cook_locs
                )
            )

        return total_cost

    if constants.CUSTOM_HEURISTIC_ID == 2:
        import math
        is_minced_tomato = state["['minced', 'tomato1']"]
        is_tomato_on_plate = state["['on', 'tomato1', 'plate1']"]
        is_lettuce_on_plate = state["['on', 'lettuce1', 'plate1']"]
        is_plate_submitted = state["['submitted', 'plate1']"]

        # Shortcut: high reward if tomato is minced
        if is_lettuce_on_plate:
            return 1000
        # Goal achieved: correct submission
        if is_plate_submitted and is_tomato_on_plate:
            return 0

        # Wrong submission
        if is_plate_submitted:
            return 1000

        def manhattan(a, b):
            return abs(a[0] - b[0]) + abs(a[1] - b[1])
        STAR = (3, 0)
        BOARD = (1, 0)
        plate1_loc = None
        tomato_loc = None
        cook_locs = {}
        board_size = (6, 7)

        # Locate items and cooks on the board
        for i in range(board_size[0]):
            for j in range(board_size[1]):
                tile = f"tile-{i}-{j}"
                if state.get(f"['at-item', 'plate1', '{tile}']"):
                    plate1_loc = (i, j)
                if state.get(f"['at-item', 'tomato1', '{tile}']"):
                    tomato_loc = (i, j)
                if state.get(f"['at', 'cook1', '{tile}']"):
                    cook_locs['cook1'] = (i, j)
                if state.get(f"['at', 'cook2', '{tile}']"):
                    cook_locs['cook2'] = (i, j)

        # Update item positions if held
        for i in range(1, 3):
            cook = f'cook{i}'
            if state.get(f"['has', '{cook}', 'tomato1']"):
                tomato_loc = cook_locs[cook]
            if state.get(f"['has', '{cook}', 'plate1']"):
                plate1_loc = cook_locs[cook]

        total_cost = 0

        # Ingredient states
        tomato_cut = state.get("['cut', 'tomato1']", False)

        # Plate contents
        tomato_on_plate = state.get("['on', 'tomato1', 'plate1']", False)
        plate_submitted = state.get("['submitted', 'plate1']", False)



        # --- TOMATO ---
        if not tomato_cut:
            total_cost += min(
                manhattan(cook_locs[c], tomato_loc) + manhattan(tomato_loc, BOARD) + 1
                for c in cook_locs
            )
        elif not is_minced_tomato:
            total_cost += min(
                manhattan(cook_locs[c], tomato_loc) + manhattan(tomato_loc, BOARD) + 1
                for c in cook_locs
            )
        if not tomato_on_plate:
            total_cost += min(
                manhattan(cook_locs[c], tomato_loc) + manhattan(tomato_loc, plate1_loc) + 1
                for c in cook_locs
            )

        # --- SUBMISSION ---
        if not plate_submitted:
            total_cost += min(
                manhattan(plate1_loc, STAR) + 1,
                min(
                    manhattan(cook_locs[c], plate1_loc) + manhattan(plate1_loc, STAR) + 1
                    for c in cook_locs
                )
            )

        return total_cost

    return  0