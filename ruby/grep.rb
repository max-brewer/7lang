#!/usr/local/bin/ruby -w
filename, expression_string = ARGV

puts "File to scan"
puts (filename ||= gets)

puts "Expression to match"
puts (expression_string ||= gets)

expression = Regexp.new(expression_string)
File.open(filename) do |file|
	file.each {|line| puts line if line =~ expression}
end
