;;;6X7 with 1 separating wall, 2 agents, goal is making tomato-lettuce salad

(define (problem kitchen-level)
  (:domain kitchen-world)

  (:objects
    ;; Agents
    cook1 cook2 - agent

    ;; Tiles (6 rows x 7 columns)
    tile-0-0 tile-0-1 tile-0-2 tile-0-3 tile-0-4 tile-0-5 tile-0-6 
    tile-1-0 tile-1-1 tile-1-2 tile-1-3 tile-1-4 tile-1-5 tile-1-6 
    tile-2-0 tile-2-1 tile-2-2 tile-2-3 tile-2-4 tile-2-5 tile-2-6 
    tile-3-0 tile-3-1 tile-3-2 tile-3-3 tile-3-4 tile-3-5 tile-3-6 
    tile-4-0 tile-4-1 tile-4-2 tile-4-3 tile-4-4 tile-4-5 tile-4-6 
    tile-5-0 tile-5-1 tile-5-2 tile-5-3 tile-5-4 tile-5-5 tile-5-6 - location

    ;; Items
    plate1 lettuce1 tomato1 - item

  )

  (:init
    (= (agent-id cook1) 0)
    (= (agent-id cook2) 1)
    ;; Agent positions and states
    (at cook1 tile-1-1)
    (at cook2 tile-1-4)
    (face cook1 S)
    (face cook2 S)
    (free-hands cook1)
    (free-hands cook2)
    (occupied tile-1-1)
    (occupied tile-1-4)
    (= (turn) 0)
    (= (number-of-agents) 2)

    (table tile-0-0)
    (table tile-0-1)
    (table tile-0-2)
    (table tile-0-3)
    (table tile-0-4)
    (table tile-0-5)
    (table tile-0-6)
    (table tile-1-3)
    (table tile-1-6)
    (table tile-2-0)
    (table tile-2-3)
    (table tile-2-6)
    (table tile-3-0)
    (table tile-3-3)
    (table tile-3-6)
    (table tile-4-0)
    (table tile-4-3)
    (table tile-4-6)
    (table tile-5-0)
    (table tile-5-1)
    (table tile-5-2)
    (table tile-5-3)
    (table tile-5-4)
    (table tile-5-5)
    (table tile-5-6)
    (walkable tile-1-1)
    (walkable tile-1-2)
    (walkable tile-1-4)
    (walkable tile-1-5)
    (walkable tile-2-1)
    (walkable tile-2-2)
    (walkable tile-2-4)
    (walkable tile-2-5)
    (walkable tile-3-1)
    (walkable tile-3-2)
    (walkable tile-3-4)
    (walkable tile-3-5)
    (walkable tile-4-1)
    (walkable tile-4-2)
    (walkable tile-4-4)
    (walkable tile-4-5)

    (cutting-board tile-1-0)
    (at-item plate1 tile-5-5)
    (at-item lettuce1 tile-1-6)
    (at-item tomato1 tile-0-4)
    (occupied tile-1-0)
    (occupied tile-5-5)
    (occupied tile-1-6)
    (occupied tile-0-4)
    (plate plate1)
    (is-tomato tomato1)
    (above tile-0-0 tile-1-0)
    (above tile-0-1 tile-1-1)
    (above tile-0-2 tile-1-2)
    (above tile-0-3 tile-1-3)
    (above tile-0-4 tile-1-4)
    (above tile-0-5 tile-1-5)
    (above tile-0-6 tile-1-6)
    (above tile-1-0 tile-2-0)
    (above tile-1-1 tile-2-1)
    (above tile-1-2 tile-2-2)
    (above tile-1-3 tile-2-3)
    (above tile-1-4 tile-2-4)
    (above tile-1-5 tile-2-5)
    (above tile-1-6 tile-2-6)
    (above tile-2-0 tile-3-0)
    (above tile-2-1 tile-3-1)
    (above tile-2-2 tile-3-2)
    (above tile-2-3 tile-3-3)
    (above tile-2-4 tile-3-4)
    (above tile-2-5 tile-3-5)
    (above tile-2-6 tile-3-6)
    (above tile-3-0 tile-4-0)
    (above tile-3-1 tile-4-1)
    (above tile-3-2 tile-4-2)
    (above tile-3-3 tile-4-3)
    (above tile-3-4 tile-4-4)
    (above tile-3-5 tile-4-5)
    (above tile-3-6 tile-4-6)
    (above tile-4-0 tile-5-0)
    (above tile-4-1 tile-5-1)
    (above tile-4-2 tile-5-2)
    (above tile-4-3 tile-5-3)
    (above tile-4-4 tile-5-4)
    (above tile-4-5 tile-5-5)
    (above tile-4-6 tile-5-6)
    (right-of tile-0-0 tile-0-1)
    (right-of tile-0-1 tile-0-2)
    (right-of tile-0-2 tile-0-3)
    (right-of tile-0-3 tile-0-4)
    (right-of tile-0-4 tile-0-5)
    (right-of tile-0-5 tile-0-6)
    (right-of tile-1-0 tile-1-1)
    (right-of tile-1-1 tile-1-2)
    (right-of tile-1-2 tile-1-3)
    (right-of tile-1-3 tile-1-4)
    (right-of tile-1-4 tile-1-5)
    (right-of tile-1-5 tile-1-6)
    (right-of tile-2-0 tile-2-1)
    (right-of tile-2-1 tile-2-2)
    (right-of tile-2-2 tile-2-3)
    (right-of tile-2-3 tile-2-4)
    (right-of tile-2-4 tile-2-5)
    (right-of tile-2-5 tile-2-6)
    (right-of tile-3-0 tile-3-1)
    (right-of tile-3-1 tile-3-2)
    (right-of tile-3-2 tile-3-3)
    (right-of tile-3-3 tile-3-4)
    (right-of tile-3-4 tile-3-5)
    (right-of tile-3-5 tile-3-6)
    (right-of tile-4-0 tile-4-1)
    (right-of tile-4-1 tile-4-2)
    (right-of tile-4-2 tile-4-3)
    (right-of tile-4-3 tile-4-4)
    (right-of tile-4-4 tile-4-5)
    (right-of tile-4-5 tile-4-6)
    (right-of tile-5-0 tile-5-1)
    (right-of tile-5-1 tile-5-2)
    (right-of tile-5-2 tile-5-3)
    (right-of tile-5-3 tile-5-4)
    (right-of tile-5-4 tile-5-5)
    (right-of tile-5-5 tile-5-6)
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
