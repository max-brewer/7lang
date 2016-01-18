#!/usr/local/bin/io

doFile("testFramework.io")

2dSum := method(2dArray,
	2dArray map(inner, inner sum) sum
)

2dArray := list(list(1,2), list(3,4))

2dSum(2dArray) shouldEqual(10)

