// add a slot called myAverage to a list that computes the average of all the numbers of the list. What happens if there are no numbers in the list? Raise an exception if any item in the list is NaN

doFile("tests.io")
List myAverage := method(
    for(i, 1, (self size),
        if (self at(i-1) == 0, return 0)

        if (self at(i-1) type != "Number",
            Exception raise("To get the average you must pass an number")
        )
    )

    self average
)

list(1, 2, 3) myAverage shouldEqual(2)
list(4, 2, 3) myAverage shouldEqual(3)
list(0) myAverage shouldEqual(0)
list(3, 2, 0) myAverage shouldEqual(0)

e := try (
list("foo") myAverage 
) 

e catch (Exception,
  e error shouldEqual("To get the average you must pass an number")
)


