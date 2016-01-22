min(A, B, C) :- A < B, A = C, !.
min(A, B, C) :- B = C.

min([A], A).
min([Head|Tail], M) :- min(Tail, M1), min(M1, Head, M).
 
