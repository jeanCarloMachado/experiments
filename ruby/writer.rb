
file = File.new('data', "w")
10.times {|i| file.puts i if i % 2 == 0 }
file.flush
