Lobby doFile("testFramework.io")

# 1 + 1 works fine, no exceptions
try(1 + 1) shouldEqual(nil)

# 1 + "one" throws an exception
try(1 + "one") type shouldEqual("Exception")

# 1 + "one" exception message indicates typing as cause
try(1 + "one") error shouldEqual("argument 0 to method '+' must be a Number, not a 'Sequence'")