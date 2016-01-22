concaternate([], List, List).
concaternate([Head|Tail1], List, [Head|Tail2]) :- concaternate(Tail1, List, Tail2).

