#!/usr/local/bin/io

OperatorTable addAssignOperator(":", "atPutNumber")

curlyBrackets := method(
	result := Map clone
	call message arguments foreach(argument,
		result doMessage(argument)
	)
	result
)

Map atPutNumber := method(
	self atPut(
		call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
		call evalArgAt(1)
	)
)

