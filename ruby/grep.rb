name = ARGV[0]
fileName = ARGV[1]


file = File.new(fileName, 'r').each do |ln|
	if ln =~ /#{name}/i
		puts ln
	end
end
