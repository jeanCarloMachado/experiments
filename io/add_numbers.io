//add up all the numbers in a two dimensional array
doFile("tests.io")

matrix := Object clone
matrix data := Map clone
matrix addValue := method(x, y, value,
    data atPut(x, (Map clone) atPut(y, value))
)

matrix getValue := method(x, y,
   (data at(x)) at(y)
)


matrix addValue("a", "b", 666)
(matrix getValue("a", "b")) shouldEqual(666)



matrix addValue("a", "a", 333)
(matrix getValue("a", "a")) shouldEqual(333)

