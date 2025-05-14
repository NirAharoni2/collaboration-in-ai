(define (domain overcooked)
    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )
    (:types agent location item station direction)

    (:constants
    N E S W - direction
    )

    (:predicates
    (at ?a - agent ?l - location)
    (occupied ?l - location)
    (holding ?a - agent ?i - item)
    (item-at ?i - item ?l - location)
    (station-at ?s - station ?l - location)
    (right-of   ?l1 - location ?l2 - location)
    (left-of    ?l1 - location ?l2 - location)
    (above      ?l1 - location ?l2 - location)
    (below      ?l1 - location ?l2 - location)
    (passable   ?l1 - location ?l2 - location)
    (face      ?a - agent     ?d - direction)
    )

    (:action move-east
    :parameters (?a    - agent
                ?from - location
                ?to   - location)
    :precondition (and
        (at       ?a   ?from)
        (right-of ?from ?to)

        (not (occupied ?to))
    )
    :effect (and
        ;; movement only if no wall
        (when (passable ?from ?to)
        (and
            ;; change position
            (not (at    ?a ?from))
            (at        ?a ?to)

            ;; update occupancy
            (occupied ?to)
            (not (occupied ?from))
        )
        )

        ;; always update facing
        (face ?a E)
        (not (face ?a W)) (not (face ?a N)) (not (face ?a S))
    )
    )

    (:action move-west
    :parameters (?a    - agent
                ?from - location
                ?to   - location)
    :precondition 
        (and
            (at       ?a   ?from)
            (left-of  ?from ?to)
            (not (occupied ?to))
    )
    :effect   
        (and
            (when (passable ?from ?to)
                (and
                    (not (at    ?a ?from))
                    (at        ?a ?to)
                    (occupied ?to)
                    (not (occupied ?from))
                )
            )
            (face ?a W)
            (not (face ?a E)) (not (face ?a N)) (not (face ?a S))
        )
    )

    (:action move-north
    :parameters (?a    - agent
                ?from - location
                ?to   - location)
    :precondition (and
        (at       ?a   ?from)
        (above    ?from ?to)
        (not (occupied ?to))
    )
    :effect (and
        (when (passable ?from ?to)
        (and
            (not (at    ?a ?from))
            (at        ?a ?to)
            (occupied ?to)
            (not (occupied ?from))
        )
        )
        (face ?a N)
        (not (face ?a E)) (not (face ?a W)) (not (face ?a S))
    )
    )

    (:action move-south
    :parameters (?a    - agent
                ?from - location
                ?to   - location)
    :precondition (and
        (at       ?a   ?from)
        (below    ?from ?to)
        (not (occupied ?to))
    )
    :effect (and
        (when (passable ?from ?to)
        (and
            (not (at    ?a ?from))
            (at        ?a ?to)
            (occupied ?to)
            (not (occupied ?from))
        )
        )
        (face ?a S)
        (not (face ?a E)) (not (face ?a W)) (not (face ?a N))
    )
    )

    (:action stay
    :parameters (?a - agent)
    :precondition (and)
    :effect    (and)
    )

;; =========================
  ;; KITCHEN ACTIONS
  ;; =========================

  ;; Pickup Onion
  (:action pickup-onion
    :parameters (?a - agent ?x - x ?y - y ?d - direction)
    :precondition (and
      (at ?a ?x ?y)
      (facing ?a ?d)
      (onion-station ?x ?y ?d)
      (hands-free ?a)
    )
    :effect (and
      (not (hands-free ?a))
      (holding-onion ?a)
    )
  )

  ;; Put Onion in Pot
  (:action put-onion-in-pot
    :parameters (?a - agent ?x - x ?y - y ?d - direction ?n - number ?n1 - number)
    :precondition (and
      (at ?a ?x ?y)
      (facing ?a ?d)
      (pot-location ?x ?y ?d)
      (holding-onion ?a)
      (pot-has ?n)
      (not (= ?n 3))
    )
    :effect (and
      (not (holding-onion ?a))
      (hands-free ?a)
      (not (pot-has ?n))
      (pot-has ?n1)
    )
  )

  ;; Soup becomes ready when pot has 3 onions
  (:action cook-soup
    :parameters ()
    :precondition (pot-has 3)
    :effect (soup-ready)
  )

  ;; Pickup Plate
  (:action pickup-plate
    :parameters (?a - agent ?x - x ?y - y ?d - direction)
    :precondition (and
      (at ?a ?x ?y)
      (facing ?a ?d)
      (plate-station ?x ?y ?d)
      (hands-free ?a)
    )
    :effect (and
      (not (hands-free ?a))
      (holding-plate ?a)
    )
  )

  ;; Fill Plate with Soup
  (:action fill-plate
    :parameters (?a - agent ?x - x ?y - y ?d - direction)
    :precondition (and
      (at ?a ?x ?y)
      (facing ?a ?d)
      (pot-location ?x ?y ?d)
      (holding-plate ?a)
      (soup-ready)
    )
    :effect (and
      (not (holding-plate ?a))
      (holding-soup ?a)
      (not (soup-ready))
      (pot-has 0)
    )
  )

  ;; Serve Soup
  (:action serve
    :parameters (?a - agent ?x - x ?y - y ?d - direction ?s - number ?s1 - number)
    :precondition (and
      (at ?a ?x ?y)
      (facing ?a ?d)
      (serving-station ?x ?y ?d)
      (holding-soup ?a)
      (score ?s)
    )
    :effect (and
      (not (holding-soup ?a))
      (hands-free ?a)
      (not (score ?s))
      (score ?s1)
    )
  )
)
