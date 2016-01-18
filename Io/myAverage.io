#!/usr/local/bin/io
doFile("testFramework.io")

List myAverage := method(self sum / self size)

list(1,2,3) myAverage shouldEqual(2)
try(list("one", "two", "three") myAverage) error shouldEqual("Io Assertion 'operation not valid on non-number encodings'")

