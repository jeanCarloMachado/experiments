doFile("tests.io")

true xor :=  method(bool, if(bool, false, true))
false xor :=  method(bool, if(bool, true, false))

(false xor false) shouldEqual(false)
(true xor true) shouldEqual(false)
(true xor false) shouldEqual(true)
(false xor true) shouldEqual(true)
