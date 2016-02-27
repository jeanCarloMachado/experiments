real := Random value(1, 100) round
write("Real: ", real, "\n")

i := 1
while (i < 11,
    "Guess a number..." println
    answer := File standardInput readLine
    answer = answer asNumber
    if (answer > real, "It's lower" print)
    if (answer < real, "It's greater" print)
    if (answer == real, "You got it!" print; return)

    i = i+1
)

