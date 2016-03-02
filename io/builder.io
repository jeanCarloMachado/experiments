Builder := Object clone
Builder level := 0
Builder indent := method(times, 
    i := 0
    while(i < times, write("   "); i = i + 1)
)
Builder forward := method(
    level = level + 1
    indent(level)
    writeln("<", call message name, ">")
    call message arguments foreach(
        arg,
        content := self doMessage(arg);
        if (content type == "Sequence", indent(level); writeln(content))
    )
    indent(level)
    writeln("</", call message name, ">")
    level = level - 1
)

Builder ul(
    li("Io")
    li({"foo": "bar"}, "Lua")
    li("JavaScript")
    li(li("foo"))
)
