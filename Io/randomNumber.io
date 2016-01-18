#!/usr/local/bin/io
randomNumber := (Random value * 100) floor + 1
lastDelta := nil
attempts := 10
while(attempts > 0 and lastDelta != 0,
	("Guess the number. It's between 1 and 100 (inclusive)") println
	guess := ReadLine readLine asNumber
	delta := (randomNumber - guess) abs
	if(delta == 0, 
		("Correct! the number was " .. randomNumber) println,
		if(lastDelta != nil,
			if(delta < lastDelta, "Warmer! " print)
			if(delta > lastDelta, "Colder! " print)
		)
		("You have " .. attempts .. " guesses left!") println
	)
		
	lastDelta = delta
	attempts = attempts -1
)

