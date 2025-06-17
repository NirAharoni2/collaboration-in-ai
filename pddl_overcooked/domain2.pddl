(define (domain kitchen-world)
  (:requirements :strips :typing :conditional-effects :disjunctive-preconditions :negative-preconditions)

  (:types
    agent item location direction
  )

  (:constants
    N S E W - direction
  )

  (:predicates
    ;; Positioning
    (at ?a - agent ?l - location)
    (at-item ?i - item ?l - location)
    (face ?a - agent ?d - direction)

    ;; Map relations
    (above ?l1 - location ?l2 - location)
    (right-of ?l1 - location ?l2 - location)
    (walkable ?l - location)
    (occupied ?l - location)

    ;; Agent state
    (has ?a - agent ?i - item)
    (free-hands ?a - agent)

    ;; Objects and surface types
    (cutting-board ?l - location)
    (table ?l - location)

    ;; Item properties
    (minced ?i - item)
    (cut ?i - item)
    (on ?i - item ?plate - item)
    (plate ?i - item)
    (is-tomato ?i - item)

    ;; Turn management
    (agent-turn ?a - agent)
    (submitted ?i - item)
    (star ?l - location)
  )

  (:action cut-ingredient
    :parameters (?obj - item ?chef - agent ?next - agent ?loc - location ?cb-loc - location)
    :precondition
      (and
        (agent-turn ?chef)
        (not (agent-turn ?next))
        (has ?chef ?obj)
        (at ?chef ?loc)
        (not (plate ?obj))
        (cutting-board ?cb-loc)
        (or
          (and (face ?chef N) (above ?cb-loc ?loc))
          (and (face ?chef S) (above ?loc ?cb-loc))
          (and (face ?chef E) (right-of ?loc ?cb-loc))
          (and (face ?chef W) (right-of ?cb-loc ?loc))
        )
      )
    :effect
      (and
        (when (and (cut ?obj) (is-tomato ?obj))
          (and
            (minced ?obj)
          )
        )
        (cut ?obj)
        (not (agent-turn ?chef))
        (agent-turn ?next)
      )
  )



  (:action pick-item
    :parameters (?obj - item ?chef - agent ?next - agent ?loc - location ?cb-loc - location)
    :precondition
      (and
        (agent-turn ?chef)
        (not (agent-turn ?next))
        (free-hands ?chef)
        (at ?chef ?loc)
        (at-item ?obj ?cb-loc)
        (or
          (and (face ?chef N) (above ?cb-loc ?loc))
          (and (face ?chef S) (above ?loc ?cb-loc))
          (and (face ?chef E) (right-of ?loc ?cb-loc))
          (and (face ?chef W) (right-of ?cb-loc ?loc))
        )
      )
    :effect
      (and
        (not (at-item ?obj ?cb-loc))
        (not (occupied ?cb-loc))
        (not (free-hands ?chef))
        (has ?chef ?obj)
        (not (agent-turn ?chef))
        (agent-turn ?next)
      )
  )

  (:action put-item
    :parameters (?obj - item ?chef - agent ?next - agent ?loc - location ?cb-loc - location)
    :precondition
      (and
        (agent-turn ?chef)
        (not (agent-turn ?next))
        (has ?chef ?obj)
        (at ?chef ?loc)
        (table ?cb-loc)
        (not (occupied ?cb-loc))
        (or
          (and (face ?chef N) (above ?cb-loc ?loc))
          (and (face ?chef S) (above ?loc ?cb-loc))
          (and (face ?chef E) (right-of ?loc ?cb-loc))
          (and (face ?chef W) (right-of ?cb-loc ?loc))
        )
      )
    :effect
      (and
        (at-item ?obj ?cb-loc)
        (free-hands ?chef)
        (not (has ?chef ?obj))
        (occupied ?cb-loc)
        (not (agent-turn ?chef))
        (agent-turn ?next)
      )
  )

  (:action submit-item
    :parameters (?obj - item ?chef - agent ?next - agent ?loc - location ?cb-loc - location)
    :precondition
      (and
        (agent-turn ?chef)
        (not (agent-turn ?next))
        (has ?chef ?obj)
        (at ?chef ?loc)
        (star ?cb-loc)
        (plate ?obj)
        (or
          (and (face ?chef N) (above ?cb-loc ?loc))
          (and (face ?chef S) (above ?loc ?cb-loc))
          (and (face ?chef E) (right-of ?loc ?cb-loc))
          (and (face ?chef W) (right-of ?cb-loc ?loc))
        )
      )
    :effect
      (and
        (submitted ?obj)
        (free-hands ?chef)
        (not (has ?chef ?obj))
        (not (agent-turn ?chef))
        (agent-turn ?next)
      )
  )

  (:action place-item-on-plate
    :parameters (?item - item ?plate - item ?chef - agent ?next - agent ?loc - location ?cb-loc - location)
    :precondition
      (and
        (agent-turn ?chef)
        (not (agent-turn ?next))
        (has ?chef ?item)
        (at ?chef ?loc)
        (at-item ?plate ?cb-loc)
        (plate ?plate)
        (or (cut ?item) (minced ?item))
        (or
          (and (face ?chef N) (above ?cb-loc ?loc))
          (and (face ?chef S) (above ?loc ?cb-loc))
          (and (face ?chef E) (right-of ?loc ?cb-loc))
          (and (face ?chef W) (right-of ?cb-loc ?loc))
        )
      )
    :effect
      (and
        (on ?item ?plate)
        (free-hands ?chef)
        (not (has ?chef ?item))
        (not (agent-turn ?chef))
        (agent-turn ?next)
      )
  )

  (:action move-west
    :parameters (?a - agent ?next - agent ?from - location ?to - location)
    :precondition (and
      (agent-turn ?a)
      (not (agent-turn ?next))
      (at ?a ?from)
      (right-of ?to ?from)
    )
    :effect (and
      (when (and (walkable ?to) (not (occupied ?to)))
        (and
          (not (at ?a ?from))
          (at ?a ?to)
          (occupied ?to)
          (not (occupied ?from))
        )
      )
      (face ?a W)
      (not (face ?a N)) (not (face ?a S)) (not (face ?a E))
      (not (agent-turn ?a))
      (agent-turn ?next)
    )
  )

  (:action move-east
    :parameters (?a - agent ?next - agent ?from - location ?to - location)
    :precondition (and
      (agent-turn ?a)
      (not (agent-turn ?next))
      (at ?a ?from)
      (right-of ?from ?to)
    )
    :effect (and
      (when (and (walkable ?to) (not (occupied ?to)))
        (and
          (not (at ?a ?from))
          (at ?a ?to)
          (occupied ?to)
          (not (occupied ?from))
        )
      )
      (face ?a E)
      (not (face ?a N)) (not (face ?a S)) (not (face ?a W))
      (not (agent-turn ?a))
      (agent-turn ?next)
    )
  )

  (:action move-south
    :parameters (?a - agent ?next - agent ?from - location ?to - location)
    :precondition (and
      (agent-turn ?a)
      (not (agent-turn ?next))
      (at ?a ?from)
      (above ?from ?to)
    )
    :effect (and
      (when (and (walkable ?to) (not (occupied ?to)))
        (and
          (not (at ?a ?from))
          (at ?a ?to)
          (occupied ?to)
          (not (occupied ?from))
        )
      )
      (face ?a S)
      (not (face ?a E)) (not (face ?a W)) (not (face ?a N))
      (not (agent-turn ?a))
      (agent-turn ?next)
    )
  )

  (:action move-north
    :parameters (?a - agent ?next - agent ?from - location ?to - location)
    :precondition (and
      (agent-turn ?a)
      (not (agent-turn ?next))
      (at ?a ?from)
      (above ?to ?from)
    )
    :effect
    (and
      (when (and (walkable ?to) (not (occupied ?to)))
        (and
          (not (at ?a ?from))
          (at ?a ?to)
          (occupied ?to)
          (not (occupied ?from))
        )
      )
      (face ?a N)
      (not (face ?a E)) (not (face ?a W)) (not (face ?a S))
      (not (agent-turn ?a))
      (agent-turn ?next)
    )
  )

  (:action do-nothing
    :parameters (?a - agent ?next - agent)
    :precondition (and
      (agent-turn ?a)
      (not (agent-turn ?next))
    )
    :effect (and
      (not (agent-turn ?a))
      (agent-turn ?next)
    )
  )
)
