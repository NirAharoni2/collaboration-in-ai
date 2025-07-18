(define (domain car)
(:requirements :typing :fluents :time :negative-preconditions)
(:predicates (running) (engineBlown) (transmission_fine) (goal_reached) )
(:functions (d) (v) (a) (up_limit) (down_limit) (running_time) )

(:process moving
:parameters ()
:precondition (and (running))
:effect (and (increase (v) (* #t (a)))
             (increase (d) (* #t (v)))
	     (increase (running_time) (* #t 1))
)
)

(:process windResistance
:parameters ()
:precondition (and (running) (>= (v) 50))
:effect (decrease (v) (* #t (* 0.1 (* (- (v) 50) (- (v) 50)))))
)


(:action accelerate
  :parameters()
  :precondition (and (running) (< (a) (up_limit)))
  :effect (and (increase (a) 1))
)

(:action decelerate
  :parameters()
  :precondition (and (running) (> (a) (down_limit)))
  :effect (and (decrease (a) 1))
)

(:event engineExplode
:parameters ()
:precondition (and (running) (>= (a) 1) (>= (v) 100))
:effect (and (not (running)) (engineBlown) (assign (a) 0))
)

(:action stop
:parameters()
:precondition(and (= (v) 0) (>= (d) 30) (not (engineBlown)) )
:effect(goal_reached)
)

)
