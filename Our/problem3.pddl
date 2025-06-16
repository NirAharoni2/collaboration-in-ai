(define (problem kitchen-level)
  (:domain kitchen-world)

  (:objects
    ;; Agents
    cook1 cook2 - agent

    ;; Tiles (6 rows x 7 columns)
    tile-0-0 tile-0-1 tile-0-2 tile-0-3 tile-0-4
    tile-1-0 tile-1-1 tile-1-2 tile-1-3 tile-1-4
    tile-2-0 tile-2-1 tile-2-2 tile-2-3 tile-2-4
    tile-3-0 tile-3-1 tile-3-2 tile-3-3 tile-3-4 - location

    ;; Items
    plate1 tomato1 lettuce1 - item

  )

  (:init
    (table tile-0-0)
    (table tile-0-1)
    (table tile-0-2)
    (table tile-0-3)
    (table tile-0-4)
    (table tile-1-4)
    (table tile-2-4)
    (table tile-3-0)
    (table tile-3-1)
    (table tile-3-2)
    (table tile-3-3)
    (table tile-2-0)
    (table tile-1-2)
    (table tile-2-2)

    (walkable tile-1-1)
    (walkable tile-1-3)
    (walkable tile-2-1)
    (walkable tile-2-3)

    (at cook1 tile-1-1)
    (at cook2 tile-1-3)
    (face cook1 S)
    (face cook2 S)
    (free-hands cook1)
    (free-hands cook2)
    (cutting-board tile-1-0)
    (at-item plate1 tile-3-3)
    (at-item tomato1 tile-1-4)
    (at-item lettuce1 tile-2-4)
    (occupied tile-1-1)
    (occupied tile-1-3)
    (occupied tile-1-4)
    (occupied tile-3-3)
    (plate plate1)
    (is-tomato tomato1)

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

    (right-of tile-0-1 tile-0-0)
    (right-of tile-0-2 tile-0-1)
    (right-of tile-0-3 tile-0-2)
    (right-of tile-0-4 tile-0-3)

    (right-of tile-1-1 tile-1-0)
    (right-of tile-1-2 tile-1-1)
    (right-of tile-1-3 tile-1-2)
    (right-of tile-1-4 tile-1-3)

    (right-of tile-2-1 tile-2-0)
    (right-of tile-2-2 tile-2-1)
    (right-of tile-2-3 tile-2-2)
    (right-of tile-2-4 tile-2-3)

    (right-of tile-3-1 tile-3-0)
    (right-of tile-3-2 tile-3-1)
    (right-of tile-3-3 tile-3-2)
    (right-of tile-3-4 tile-3-3)


  )

  (:goal
    (and
      ;(cut tomato1)
      (cut lettuce1)
      ;(at-item tomato1 tile-1-3)
      ;(on tomato1 plate1)
      (on lettuce1 plate1)
      (at-item plate1 tile-2-0)
    )
  )
)