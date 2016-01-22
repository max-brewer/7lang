min(A, B, A) :- A < B, !.
min(A, B, B).

max(A, B, B) :- min(A, B, A).

bubble([Head|Tail], Sorted) :- bubble([], Head, Tail, [], Sorted).

bubble([], Current, [], Done, Sorted) :-
	append([Current], Done, Sorted),
	!.

bubble(Before, Current, [Something], Done, Sorted) :-
	append([Something], Done, Done1),
	bubble([], Current, Before, Done1, Sorted),
	!.

bubble(Before, Current, [Head|Tail], Done, Sorted) :- 
	min(Current, Head, Lo),
	max(Current, Head, Hi),
	append(Before, [Lo], Before1),
	bubble(Before1, Hi, Tail, Done, Sorted),
	!.

