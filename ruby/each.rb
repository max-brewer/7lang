#!/usr/local/bin/ruby -w
array = (0..15).collect {rand(9)}

def using_each array
	mini = []
	array.each do |i|
		mini.push i
		if mini.length == 4
			puts mini.to_s
			mini = []
		end
	end
end

def using_each_slice array
	array.each_slice(4) {|slice| puts slice.to_s}
end

puts "using each"
using_each array

puts "using each_slice"
using_each_slice array
