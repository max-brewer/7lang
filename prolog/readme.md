# Notes on Prolog

A strange language. It would be nice to see how it works behind the scenes. Presumably it just simplifies and then brute forces. I assume that it is prone to needing strange optimizations in the same way that SQL tends to.

## Day 1
### Self-study

#### Found:
+ Some free prolog tutorials from [the University of Texas](https://www.google.nl/search?client=safari&rls=en&q=gnu+prolog&ie=UTF-8&oe=UTF-8&gfe_rd=cr&ei=9qCfVrKLJtDHoQeW3ZawBw#q=gnu+prolog+tutorial) and [the University of Iowa](http://homepage.cs.uiowa.edu/~hzhang/c145/gprolog.htm)
+ [The top answer from google](http://www.swi-prolog.org/forum) for support forum and the [Stack overflow page](http://stackoverflow.com/questions/tagged/prologi)
+ [The reference for GNU Prolog](http://www.gprolog.org)

#### Done:
+ [Made a simple knowledge base of books from my kindle library](./books.pl)
+ Found all the books by Robert C. Martin therein `?- book_author(Which, robert_c_martin)`
+ [Made a knowledge base of musicians and instruments](./musicians.pl). Thanks to [David Bowie FAQ](http://www.bowiewonderworld.com/faq.htm) for the extensive list of instruments and [Wikipidia](https://en.wikipedia.org/wiki/Main_Page) for the genres (slightly edited for more matches (Art Rock?)).
+ Found all musicians who play the guitar `?- musician_instrument(Who, guitar).`