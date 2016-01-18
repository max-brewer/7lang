#!/usr/local/bin/io
Matrix := Object clone
Matrix underlyingList ::= nil
Matrix dim := method(x, y, 	
	setUnderlyingList(Range 1 to(y) map(row, Range 1 to(x) map(value, nil)))
)

Matrix set := method(x, y, value, underlyingList at(y) atPut(x, value))
Matrix get := method(x, y, underlyingList at(y) at(x))
Matrix transpose := method(
	oldList := self underlyingList
	
	
	oldWidth := oldList at(0) size
	self underlyingList = Range 1 to(oldWidth) map(row, list())
	oldList foreach(row, 
		row foreach(i, item,
			self underlyingList at(i) append(item)
		)
	)

	return self
)
Matrix == := method(other, self underlyingList == other underlyingList)

doFile("testFramework.io")
matrix1 := Matrix clone
matrix1 dim(2,3)
matrix1 underlyingList size shouldEqual(3)
matrix1 underlyingList foreach(row, row size shouldEqual(2))
matrix1 transpose
matrix1 underlyingList size shouldEqual(2)
matrix1 underlyingList foreach(row, row size shouldEqual(3))

matrix1 underlyingList = list(list(1,2), list(3,4))
matrix2 := Matrix clone
matrix2 underlyingList := list(list(1,3), list(2,4))

matrix1 transpose shouldEqual(matrix2)
