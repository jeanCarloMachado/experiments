class Foo
    def method_missing name, *arg
        puts "Couldnt find the given method"
    end
end

Foo.new.teste
