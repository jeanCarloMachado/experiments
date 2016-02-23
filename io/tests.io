Object shouldEqual := method(expected,
  if(self == expected,
      "." print,
      ("Expected " .. self .. " to equal " .. expected) println
    )
)
