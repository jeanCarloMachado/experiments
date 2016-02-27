
myContent := File with("/tmp/test") openForReading contents
myContent := doString(myContent)
myContent atPut(0, "Jean Carlo Machado")
myContent println

