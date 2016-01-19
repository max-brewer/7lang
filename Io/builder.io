#!/usr/local/bin/io

Builder := Object clone
Builder forward := method(
	writeln("<", call message name, ">")
	call message arguments foreach(argument,
		content := self doMessage(argument)
		if(content type == "Sequence", writeln(content))
	)
	writeln("</", call message name, ">")
)

Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript")
)
