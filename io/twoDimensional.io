#write a prototype for a two dimensional list. The dim(x,y) method should alocate a list of y lists that are x elements long. set(x, y, value) should set an value and get(x,y) should return that value

doFile("tests.io")

List dim := method(x,y, 
    self internalList := List clone
    for(i, 1, y,
        xList := List clone
        for(j, 1, x,
            xList append(0)
        )
        internalList append(xList)
    )
)

List set := method(x, y, value,
    tmpList := internalList at(y)
    tmpList atPut(x, value)
    self internalList atPut(y, tmpList)
)

List get := method(x, y,
    internalList at(y) at(x)
)
/// - y
//x - 1 2 3
//  - 4 5 6

/// - y
//x - 1 4  
//  - 2 5 6
//    3


List transpose := method(
    tmp := self clone
    oldY := self internalList at(0) size
    oldX := self internalList size
    tmp dim(oldY, oldX)

    for(i, 1, oldX,
        for(j, 1, oldY,
            tmp set(j-1,i-1, self get(i-1, j-1))
        )
    )
    return tmp
)



foo := List clone
foo dim(10,10)
foo internalList at(0) at(0) shouldEqual(0)
foo internalList at(10) shouldEqual(nil)
foo internalList at(9) at(10) shouldEqual(nil)


foo internalList at(3) at(5) shouldEqual(0)
foo set(5, 3, 666)
foo get(5, 3) shouldEqual(666)
foo get(2, 3) shouldEqual(0)

bar := foo transpose
(bar get(3, 5)) shouldEqual(foo get(5, 3))


file := File clone openForUpdating("/tmp/test")
file write(foo internalList serialized)
file close


