class CsvRow
	attr_accessor :headers, :data

	def method_missing name, *args
		@data[@headers.index(name.to_s).to_i]
	end

	def initialize headers, data=[]
		@headers = headers
		@data = data
	end
end

class ActAsCsv
	def self.acts_as_csv
		define_method 'read' do
			fileName = self.class.to_s.downcase + '.txt'
			file = File.new(fileName)
			@headers = file.gets.chomp.split(', ')

			file.each do |row|
				break if 2 > row.chomp.split(', ').count
				@result.push CsvRow.new @headers,row.chomp.split(', ')
			end
		end
		define_method "headers" do
			@headers
		end

		define_method "csv_contents" do
			@result
		end

		define_method 'initialize' do
			@result = []
			read
		end
	end
end

class RubyCsv < ActAsCsv
	acts_as_csv
end

m = RubyCsv.new
#puts m.headers.inspect
#puts m.csv_contents[0].headers.inspect
#puts m.csv_contents[0].data.inspect
m.csv_contents.each {|row| puts row.name}
