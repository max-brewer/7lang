#!/usr/local/bin/io

curlyBrackets := method(call message arguments map(argument, doMessage(argument)))

doFile("testFramework.io")

{1} shouldEqual(list(1))
{1,2} shouldEqual(list(1,2))
{{1,2},{3,4}} shouldEqual(list(list(1,2),list(3,4)))
{1,{2,{3}}} shouldEqual(list(1,list(2,list(3))))

