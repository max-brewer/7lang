# Using testFramework (https://github.com/sermoa/7languages7weeks/blob/master/week2-io/testFramework.io) by aimee rivers (https://github.com/sermoa)

Object shouldEqual := method(expected,
  if(self == expected, "." print, ("Expected " .. self .. " to equal " .. expected) println)
)