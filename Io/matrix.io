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
Matrix toString := method(
	self underlyingList map(row, row join(", ")) join("\n")
)

doFile("testFramework.io")


# matrix dim sets correct dimensions
matrix1 := Matrix clone
matrix1 dim(2,3)
matrix1 underlyingList size shouldEqual(3)
matrix1 underlyingList foreach(row, row size shouldEqual(2))

# matrix transpose sets correct dimentsions
matrix1 transpose
matrix1 underlyingList size shouldEqual(2)
matrix1 underlyingList foreach(row, row size shouldEqual(3))

# matrix contents are transposed correctly
matrix1 underlyingList = list(list(1,2), list(3,4))
matrix2 := Matrix clone
matrix2 underlyingList := list(list(1,3), list(2,4))
matrix1 transpose shouldEqual(matrix2)

# matrix toString works for a 1X1 matrix
matrix3 := Matrix clone
matrix3 dim(1,1)
matrix3 set(0,0,1)
matrix3 toString shouldEqual("1")

# matrix toString comma separates a line
matrix4 := Matrix clone
matrix4 dim(2,1)
matrix4 set(0,0,1)
matrix4 set(1,0,2)
matrix4 toString shouldEqual("1, 2")

# matrix toString line separates rows
matrix5 := Matrix clone
matrix5 dim(2,2)
matrix5 set(0,0,1)
matrix5 set(1,0,2)
matrix5 set(0,1,3)
matrix5 set(1,1,4)
matrix5 toString shouldEqual("1, 2\n3, 4")


