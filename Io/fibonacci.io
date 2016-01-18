#!/usr/local/bin/io

doFile("testFramework.io")

fibonacci := Object clone
fibonacci recursion := method(depth, current, previous,
	if(depth == 0, return current)
	if(previous == nil, previous = 0)
	next := if(current, current + previous, 1)   
	return recursion(depth-1, next, current)
)
fibonacci loops := method(iterations,
	values := list()
	for(i, 0, iterations - 1,
		length := values size
		next := if(length < 2, 1, values at(length - 1) + values at(length-2))
		values append(next)
	)

	return values last
)	

test := Object clone
test shouldBe := method(iterations, outcome,
	fibonacci recursion(iterations) shouldEqual(outcome)
	fibonacci loops(iterations) shouldEqual(outcome)
)

test shouldBe(1,1)
test shouldBe(3,2)
test shouldBe(5,5)

