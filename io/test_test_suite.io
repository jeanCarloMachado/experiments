doFile("tests.io")

true shouldEqual(true)
(true and true) shouldEqual(true)
(true or false) shouldEqual(true)
false shouldEqual(false)

//"Expected false to equal true" shouldEqual(false shouldEqual(true))

