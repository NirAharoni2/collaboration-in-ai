;;;4X5 with 1 separating wall, 2 agents, goal is making tomato-lettuce salad
(define (problem kitchen-level-renumbered)
  (:domain kitchen-world)

  (:objects
    ;; Agents
    cook1 cook2 cook3 - agent

    ;; Tiles (4x5 layout)
    tile-0-0 tile-0-1 tile-0-2 tile-0-3 tile-0-4
    tile-1-0 tile-1-1 tile-1-2 tile-1-3 tile-1-4
    tile-2-0 tile-2-1 tile-2-2 tile-2-3 tile-2-4
    tile-3-0 tile-3-1 tile-3-2 tile-3-3 tile-3-4 - location

    ;; Items
    plate1 lettuce1 tomato1 - item

  )

  (:init
    (= (agent-id cook1) 0)
    (= (agent-id cook2) 1)
    ;; Agent positions and states
    (at cook1 tile-1-1)
    (at cook2 tile-1-3)
    (face cook1 S)
    (face cook2 S)
    (free-hands cook1)
    (free-hands cook2)
    (occupied tile-1-1)
    (occupied tile-1-3)
    (= (turn) 0)
    (= (number-of-agents) 2)

    ;; Walkable tiles
    (walkable tile-1-1)
    (walkable tile-1-3)
    (walkable tile-2-1)
    (walkable tile-2-3)

    ;; Tables
    (table tile-0-0)
    (table tile-0-1)
    (table tile-0-3)
    (table tile-0-4)
    (table tile-1-0)
    (table tile-1-2)
    (table tile-1-4)
    (table tile-2-0)
    (table tile-2-2)
    (table tile-2-4)
    (table tile-3-0)
    (table tile-3-1)
    (table tile-3-3)
    (table tile-3-4)



    ;; Items
    (at-item plate1 tile-3-3)
    (at-item lettuce1 tile-1-4)
    (at-item tomato1 tile-0-3)
    (plate plate1)
    (is-tomato tomato1)
    (occupied tile-3-3)
    (occupied tile-0-3)
    (occupied tile-1-4)

    ;; Cutting board
    (cutting-board tile-1-0)
    (occupied tile-1-0)

    ;; Above relationships
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


    ;; Right-of relationships
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


    ;; Star location
    (star tile-2-0)
    (occupied tile-2-0)
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
