OperatorTable addAssignOperator("=>", "atPutNumber")
squareBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable 
        call evalArgAt(1) 
    )
)

s := File with("data.txt") openForReading contents
phoneNumbers := doString(s)
phoneNumbers keys println
phoneNumbers values println
