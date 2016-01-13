#!/usr/local/bin/ruby -w
module ActsAsCsv
	def self.included(base)
		base.extend ClassMethods
	end
end

module ClassMethods
	def acts_as_csv
		include InstanceMethods
	end
end

module InstanceMethods
	attr_accessor :headers, :csv_contents

	def read
		@csv_contents = []
		filename = self.class.to_s.downcase + '.txt'
		file = File.new(filename)
		@headers = file.gets.chomp.split(', ')

		file.each do |row|
			@csv_contents << row.chomp.split(', ')
		end
	end

	def each &block
		@csv_contents.each do |row|
			block.call CsvRow.new(@headers, row)
		end
	end

	def initialize
		read 
	end
end

class CsvRow
	def initialize headers, contents
		@headers = headers
		@contents = contents
	end

	def method_missing name, *args
		if (index = @headers.index name.to_s)
			return @contents[index]
		end

		super.method_missing name, *args
	end
end

class RubyCsv
	include ActsAsCsv
	acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each{|row| puts row.two}

