# Notes on Io

First impression, quite nice. As predicted this is very dificult to google for. Where is the testing library?
This is a very nice explaination of prototyping. It is also very handy how the console gives you the address of everything just so you can be sure that you aren't being fooled. Very nice from a learning perspective.

## Day 1 Self-Study

### Found:
+ [Some Io Examples](https://gist.github.com/jezen/7972975)
+ [An Io community that will answer questions](http://stackoverflow.com/questions/tagged/iolanguage)
+ [A Style Guide With Io idioms](https://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide)

### Answers:
[Test framework](https://github.com/sermoa/7languages7weeks/blob/master/week2-io/testFramework.io) by [Aimee Rivers (sermoa)](https://github.com/sermoa) licensed under [BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode)
+ [Io is strongly typed](./strongTyping.test.io).
+ [0 is true in Io, "" is true and mil is false](./truthy.test.io).
+ You can tell what slots a prototype supports by asking. (e.g. `Object proto slotNames`)
+ = assigns to a slot := creates and assigns to a slot, and ::= creates a new slot with a setter and asigns it.

### Done:
+ Run an Io program from a file.
+ [Execute the code in a slot given its name](./executeSlotByName.io)
