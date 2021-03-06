#!/usr/local/bin/io

Builder := Object clone
Builder forward := method(
	indentation := call coroutine callStack select(layer,
		layer sender == self) map(depth, "  ") join
	
	writeln(indentation, "<", call message name, ">")
	call message arguments foreach(argument,
		content := self doMessage(argument)
		if(content type == "Sequence", writeln(indentation, "  ", content))
	)
	writeln(indentation, "</", call message name, ">")
)

Builder ul(
	li("Io"),
	li("Lua"),
	li("JavaScript")
)
