# Notes on Prolog

A strange language. It would be nice to see how it works behind the scenes. Presumably it just simplifies and then brute forces. I assume that it is prone to needing strange optimizations in the same way that SQL tends to.

## Day 1
### Self-study

#### Found:
+ Some free prolog tutorials from [the University of Texas](https://www.google.nl/search?client=safari&rls=en&q=gnu+prolog&ie=UTF-8&oe=UTF-8&gfe_rd=cr&ei=9qCfVrKLJtDHoQeW3ZawBw#q=gnu+prolog+tutorial) and [the University of Iowa](http://homepage.cs.uiowa.edu/~hzhang/c145/gprolog.htm)
+ [The top answer from Google](http://www.swi-prolog.org/forum) for support forum and the [Stack overflow page](http://stackoverflow.com/questions/tagged/prologi)
+ [The reference for GNU Prolog](http://www.gprolog.org)

#### Done:
+ [Made a simple knowledge base of books from my kindle library](./books.pl)
+ Found all the books by Robert C. Martin therein `?- book_author(Which, robert_c_martin)`
+ [Made a knowledge base of musicians and instruments](./musicians.pl). Thanks to [David Bowie FAQ](http://www.bowiewonderworld.com/faq.htm) for the extensive list of instruments and [Wikipidia](https://en.wikipedia.org/wiki/Main_Page) for the genres (slightly edited for more matches (Art Rock?)).
+ Found all musicians who play the guitar `?- musician_instrument(Who, guitar).`

## Day 2

Day two strongly reminds me of the old days studying mathematics. All the solutions seem like proof by induction in reverse. This makes sense in a way as we are not trying to prove anything, but rather to show something. With each recursive iteration, we simplify until we are left with the null case. It's all very elegant and terse. Even the syntax reminds me of various mathematical syntaxes, long forgotten.

### Self-Study

#### Found

##### Implementations of [Fibonacci series](http://www.cs.utexas.edu/~cannata/cs345/Class%20Notes/Prolog%20examples.pdf) and factorials.

###### Fibonacci series

These implementations of Fibonacci series from the University of Texas work slightly differently from one another. The first is a recursive algorithm:
	fib(0,0).
	fib(1,1).
	fib(X, Y) :- 		X > 1,
				X2 is X - 2, fib(X2, XY),
				X1 is X - 1, fib(X1, Y1),
				Y is Y1 + Y2.

+ First they set out the base rules for fib(0) and fib(1). 
+ Then they've made a nice guard clause `X > 1` to prevent an infinite loop for negative numbers.
+ The next two lines instruct to find the values for fib(x-1) and fib(x-2).
+ The last line says that the result will be the sum of the last two values.

This all looks to be quite inefficient. For example, the value of fib(x-2) will have to be found twice. Once for fib(x) and once while finding fib(x-1). The number of calculations required will increase exponentially, although this could be easily cached by the language runtime.

Luckily. The fine folks at the [University of Texas](http://www.utexas.edu) have provided another implementation which they have even, rather helpfully, labeled "Efficient Fibonacci Program":

	fib(0, 0).
	fib(X, Y) :- X > 0, fib(X, Y, _).

	fib(1, 1, 0)	
	fib(X, Y1, Y2) :-
		X > 1,
		X1 is X - 1,
		fib(X1, Y2, Y3),
		Y1 is Y2 + Y3.

+ First set out the zero case.
+ The second rule says that for every X greater than 1, there is a solution to the three value algorithm. This effectively delegates to the three value algorithm.
+ The solution to the three value algorithm for X=1 is provided.
+ Then it goes on to explain how. First by stating that the value of X must be greater than 1, preventing prolog from searching out additional solutions.
+ The next lines explain that for each recursion of the algorithm, the solution will be the sum of the two y values for the next recursion (i.e. the value of y1 is the sum of the next two y's). It is effectively the same as the first algorithm, except that it is passing the value of x-2 through the steps to prevent redundant calculations.

###### Factorial (n!)

These examples come from the nice people at [Rosetta Code](http://rosettacode.org/wiki/Rosetta_Code).

First is the Recursive example:

	fact(X, 1) :- X < 2.
	fact(X, F) :- Y is X - 1, fact(Y, Z), F is Z * X.

+ First rule is very simple. Factorial of anything less than 2 is 1.
+ The second line is also rather simple. The factorial of X is X times the factorial of X-1. Exactly as in the mathematical definition but with slightly more keyboard-friendly syntax.

Then the tail recursive:

	fact(N, NF) :- fact(1, N, 1, NF).
	
	fact(X, X, F, F) :- !.
	fact(X, N, FX, F) :-
		FX1 is FX * X,
		X1 is X + 1,
		fact(X1, N, FX1, F).

This one doesn't actually produce the right result. It produces the result for (N-1)!. Not ideal.
+ First it delegates to the 4 variable version. This has a place holder for the current iteration and for the running factorial value. These are both set to one initially.
+ The ! indicates to stop processing. So, if the first two values and last two values can be equal, that is a solution and should be used.
+ The factorial total for the next iteration is set to the current iteration number * the current factorial value. (This is the mistake. It should be multiplied by the next value to give the next number.)
+ The iteration number is incremented by 1.
+ The next iteration is invoked, with a record of where to stop.

This is effectively the same as the first version, just laid out differently so as to allow tail recursion as an optimisation.

Here's the fixed version:

	fact(N, NF) :- fact(1, N, 1, NF).
	fact(X, X, F, F) :- !.
	fact(X, N, FX, F) :-
		X1 is X + 1,
		FX1 is FX * X1,
		fact(X1, N, FX1, F).

###### Towers of Hanoi

I found [this implementation by Vladimir Vacic, Christos Koufogiannakis](http://alumni.cs.ucr.edu/~vladimir/cs171/prolog_3.pdfi), from [the University of California at Riverside](http://www.ucr.edu). There were others, but this one is in a lovely pdf, and I found the reporting more elegant than in other (otherwise identical) solutions.

	hanoi(N) :- move(N, left, center, right).

	move(0, _, _, _) :- !.
	move(N, A, B, C) :-
		M is N - 1,
		move(M, A, C, B),
		inform(A, B),
		move(M, C, B, A),

	inform(X, Y) :- write([move, disk, from, X, to, Y]).

The gist of this is that you move all but one disks from the start pole to the spare pole. You then move the largest disk from the start pole to the target pole. Finally, you move all the remaining disks from the spare pole to the target pole.

Once there are no disks left to move, you stop trying to move them.

##### Being Careful With Negation in Prolog

Because in prolog, the concept of truth is equivalent to being provable using the facts presented in the knowledge base, negation can have counter-intuitive results. The logical space of prolog is a /Closed World/ where anything not proven by a rule is automatically considered false. For this reason negation will be very truth happy.

