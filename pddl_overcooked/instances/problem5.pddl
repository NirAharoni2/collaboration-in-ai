;;;5X5 with separating wall between each agent 4 agents, goal is making tomato-lettuce salad

(define (problem kitchen-level)
  (:domain kitchen-world)

  (:objects
    ;; Agents
    cook1 cook2 cook3 cook4 - agent

    ;; Tiles (5 rows x 5 columns)
    tile-0-0 tile-0-1 tile-0-2 tile-0-3 tile-0-4
    tile-1-0 tile-1-1 tile-1-2 tile-1-3 tile-1-4
    tile-2-0 tile-2-1 tile-2-2 tile-2-3 tile-2-4
    tile-3-0 tile-3-1 tile-3-2 tile-3-3 tile-3-4
    tile-4-0 tile-4-1 tile-4-2 tile-4-3 tile-4-4 - location

    ;; Items
    plate1 lettuce1 tomato1 - item

  )

  (:init
    (= (agent-id cook1) 0)
    (= (agent-id cook2) 1)
    (= (agent-id cook3) 2)
    (= (agent-id cook4) 3)
    ;; Agent positions and states
    (at cook1 tile-1-1)
    (at cook2 tile-1-3)
    (at cook3 tile-3-3)
    (at cook4 tile-3-1)
    (face cook1 S)
    (face cook2 S)
    (face cook3 S)
    (face cook4 S)
    (free-hands cook1)
    (free-hands cook2)
    (free-hands cook3)
    (free-hands cook4)
    (occupied tile-1-1)
    (occupied tile-1-3)
    (occupied tile-3-3)
    (occupied tile-3-1)
    (= (turn) 0)
    (= (number-of-agents) 4) ; change this if you have more agents

    (table tile-0-0)
    (table tile-0-1)
    (table tile-0-2)
    (table tile-0-3)
    (table tile-0-4)
    (table tile-1-0)
    (table tile-1-2)
    (table tile-1-4)
    (table tile-2-0)
    (table tile-2-1)
    (table tile-2-2)
    (table tile-2-3)
    (table tile-2-4)
    (table tile-3-0)
    (table tile-3-2)
    (table tile-3-4)
    (table tile-4-0)
    (table tile-4-1)
    (table tile-4-2)
    (table tile-4-3)
    (table tile-4-4)

    (walkable tile-1-1)
    (walkable tile-1-3)
    (walkable tile-3-3)
    (walkable tile-3-1)

    (cutting-board tile-1-0)
    (at-item plate1 tile-4-3)
    (at-item lettuce1 tile-1-4)
    (at-item tomato1 tile-0-3)
    (occupied tile-1-0)
    (occupied tile-4-3)
    (occupied tile-1-4)
    (occupied tile-0-3)

    (plate plate1)
    (is-tomato tomato1)
    ;; Above relations (within 0–4 grid)
    (above tile-0-0 tile-1-0)
    (above tile-0-1 tile-1-1)
    (above tile-0-2 tile-1-2)
    (above tile-0-3 tile-1-3)
    (above tile-0-4 tile-1-4)
    (above tile-1-0 tile-2-0)
    (above tile-1-1 tile-2-1)
    (above tile-1-2 tile-2-2)
    (above tile-1-3 tile-2-3)
    (above tile-1-4 tile-2-4)
    (above tile-2-0 tile-3-0)
    (above tile-2-1 tile-3-1)
    (above tile-2-2 tile-3-2)
    (above tile-2-3 tile-3-3)
    (above tile-2-4 tile-3-4)
    (above tile-3-0 tile-4-0)
    (above tile-3-1 tile-4-1)
    (above tile-3-2 tile-4-2)
    (above tile-3-3 tile-4-3)
    (above tile-3-4 tile-4-4)

    ;; Right-of relations (within 0–4 grid)
    (right-of tile-0-0 tile-0-1)
    (right-of tile-0-1 tile-0-2)
    (right-of tile-0-2 tile-0-3)
    (right-of tile-0-3 tile-0-4)
    (right-of tile-1-0 tile-1-1)
    (right-of tile-1-1 tile-1-2)
    (right-of tile-1-2 tile-1-3)
    (right-of tile-1-3 tile-1-4)
    (right-of tile-2-0 tile-2-1)
    (right-of tile-2-1 tile-2-2)
    (right-of tile-2-2 tile-2-3)
    (right-of tile-2-3 tile-2-4)
    (right-of tile-3-0 tile-3-1)
    (right-of tile-3-1 tile-3-2)
    (right-of tile-3-2 tile-3-3)
    (right-of tile-3-3 tile-3-4)
    (right-of tile-4-0 tile-4-1)
    (right-of tile-4-1 tile-4-2)
    (right-of tile-4-2 tile-4-3)
    (right-of tile-4-3 tile-4-4)

    (star tile-3-0)
    (occupied tile-3-0)
  )

  (:goal
    (and
      (not (minced tomato1))
      (on tomato1 plate1)
      (on lettuce1 plate1)
      (submitted plate1)
    )
  )
)