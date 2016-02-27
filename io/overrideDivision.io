doFile("tests.io")


OperatorTable addOperator("myDivision", 1)
Number setSlot("myDivision", method(d,  if (d == 0, 0, self / d)))


( 6 myDivision(6) ) shouldEqual(1)
( 6 myDivision(2) ) shouldEqual(3)
( 6 myDivision(0) ) shouldEqual(0)

 /* Number setSlot("/", method(d,  if (d == 0, 0, self / d))) */
/* ( 6 / 0 ) shouldEqual(0) */
/* ( 6 / 2 ) shouldEqual(3) */
