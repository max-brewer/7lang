#!/usr/local/bin/ruby -w

def in_range number
    0 < number && number <= 10
end

puts "Guess my number, beach! (it's between one and ten, I promise)"
number = rand(10) + 1

until in_range(guess = gets.to_i) do
    puts "Pick a number between 1 and 10, dummy"
end

puts(guess == number ? "Good guess!" : "You loose! It was #{number}")
  
