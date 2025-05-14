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




)