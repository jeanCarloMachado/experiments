
Object setSlot("foo", method("method foo" println))
Object setSlot("bar", method("method bar" println))


slotToRun := "bar"


Object getSlot(slotToRun) call
