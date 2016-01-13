Lobby doFile("testFramework.io")

# 0 is true
(0 and true) shouldEqual(true)

# "" is true
("" and true) shouldEqual(true)

# nil is false
(nil or false) shouldEqual(false)