slotter := Object clone
slotter slotty := method(argument, writeln(
	"you called a method with the argument '", argument, "'")
)

slotter perform("slotty", "slot argument")
