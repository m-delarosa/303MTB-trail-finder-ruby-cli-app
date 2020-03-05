require "tty-prompt"

class Cli
   def test
    puts "Welcome to the 303 MTB Trail Finder App!"
    gets
    puts "What's your name?"
    binding.pry
   end
end