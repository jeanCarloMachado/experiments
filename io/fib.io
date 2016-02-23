doFile("tests.io")

Fib := Object clone
Fib prevA := 1
Fib prevB := 1
Fib getNthNumber := method(number, 
    if(number == 1, return 1)
    if(number == 2, return 1)
    i := 1
    while(i <= number -2, i=i+1; 
        tmp := prevB
        prevB = prevA+prevB
        prevA = tmp
    )
    return prevB
)

myfib := Fib clone
myfib getNthNumber(1) shouldEqual(1)

myfib = Fib clone
myfib getNthNumber(2) shouldEqual(1)
myfib = Fib clone
myfib getNthNumber(4) shouldEqual(3)
myfib = Fib clone
myfib getNthNumber(5) shouldEqual(5)
myfib = Fib clone
myfib getNthNumber(6) shouldEqual(8)
myfib = Fib clone
myfib getNthNumber(7) shouldEqual(13)

//1, 1, 2, 3, 5, 8, 13
