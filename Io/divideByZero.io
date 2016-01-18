#!/usr/local/bin/io

doFile("testFramework.io")
(3 / 2) shouldEqual(1.5)
#(3 / 0) shouldEqual(inf) I can't work out how to access inf currently without dividing by zero. A little annoying.

Number oldDivide := Number getSlot("/")
Number / = method(denominator,
	if(denominator == 0, 0, self oldDivide(denominator))
)

(3 / 2) shouldEqual(1.5)
(3 / 0) shouldEqual(0)

