reverse_list([Head|Tail], Reversed) :- Tail = [], Reversed = [Head].
reverse_list([Head|Tail], Reversed) :- 
	reverse_list(Tail, ReversedTail),
	append(ReversedTail, [Head], Reversed).
