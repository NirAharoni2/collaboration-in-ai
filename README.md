# Overcooked Planning and Simulation

This repository contains two main components for simulating and planning in Overcooked environments:

- `pddl_overcooked/` – PDDL planning framework and instances  
- `overcooked/` – Python environment for simulating execution

---

## 📁 Folder Structure

### `pddl_overcooked/`

This folder includes everything related to domain planning using PDDL.

#### 🔹 Domain
- Contains the PDDL domain used for planning.

#### 🔹 `nyx/` – Planner
- Includes the planner (`nyx`) along with custom heuristics:
  - `heuristic_functions.py` defines two heuristics:
    - `heuristic_id = 1`: For levels with **tomato-lettuce salad** as the goal.
    - `heuristic_id = 2`: For levels with **tomato soup** as the goal.

#### 🔹 Instances
- Contains a set of problem instances and their respective plans under the `plans/` folder.

##### Problem Overview

| Problem   | Grid Size | Separating Walls            | Agents | Goal                    |
|-----------|-----------|------------------------------|--------|-------------------------|
| problem1  | 6x7       | 1 wall                       | 2      | Tomato-lettuce salad    |
| problem2  | 6x7       | 1 wall                       | 3      | Tomato-lettuce salad    |
| problem3  | 4x5       | 1 wall                       | 2      | Tomato-lettuce salad    |
| problem4  | 4x5       | 1 wall                       | 3      | Tomato-lettuce salad    |
| problem5  | 5x5       | Wall between each agent      | 4      | Tomato-lettuce salad    |
| problem6  | 5x5       | None                         | 1      | Tomato-lettuce salad    |
| problem7  | 5x5       | None                         | 2      | Tomato-lettuce salad    |
| problem8  | 5x5       | None                         | 3      | Tomato-lettuce salad    |
| problem9  | 5x5       | None                         | 4      | Tomato-lettuce salad    |
| problem10 | 5x5       | None                         | 2      | Tomato soup             |
---

### `overcooked/`

This folder contains the simulation and interaction environment.

- **`env_overcooked/`**  
  Implementation of the Overcooked environment.

- **`main/`**  
  Executes a plan within the Overcooked environment.

---

## ▶️ How to Use
install pygame

To run a simulation for a specific level, use the following command in your terminal from collaboration-in-ai folder:

```bash
python -m overcooked.main <level_id>
```
<sub>💡 Note: The `<level_id>` corresponds directly to the problem number listed in the table above. For example, problem3 means level_id = 3. (problem 9 doesn't have a simulation)</sub>
