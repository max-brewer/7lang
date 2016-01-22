concaternate([], List, List).

concaternate([Head|[]], List, [Head|List]).

concaternate([Head1|[Head2|[]]], List, [Head1,Head2|List]).
concaternate([Head1|[Head2|[Head3|[]]]], List, [Head1, Head2, Head3|List]).

