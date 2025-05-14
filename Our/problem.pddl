(define (problem overcooked-problem)
  (:domain overcooked)

  (:objects
    s1 s2 - agent
    l11 l12 l13 l21 l22 l23 - location
    onion plate - item
    serving-station - station
    N E S W - direction
  )

  (:init
    ;; Starting positions of agents
    (at s1 l11)
    (at s2 l23)
    
    ;; Starting facing directions
    (face s1 E)
    (face s2 W)

    ;; Item and station locations
    (item-at onion l12)
    (item-at plate l23)
    (pot-location l11 E)
    (plate-station l23 E)
    (serving-station l21 E)

    ;; Hands-free status
    (hands-free s1)
    (hands-free s2)
    (not (holding-onion s1))
    (not (holding-plate s1))
    (not (holding-onion s2))
    (not (holding-plate s2))
    
    ;; The pot is initially empty
    (pot-has 0)
    
    ;; The soup is not ready initially
    (not (soup-ready))
    
    ;; Initial score
    (score 0)
  )

  (:goal
    (and
      ;; The goal is to serve at least one soup
      (score 1)
    )
  )

  (:constraints
    ;; Ensure that agents cannot collide (prevent occupying the same location at the same time)
    (not (at s1 l23)) ;; For example, agent s1 can't occupy the same location as s2
    (not (at s2 l11))
  )
)
