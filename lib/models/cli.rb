require "tty-prompt"

class Cli
    attr_accessor :session_user

    def prompt
        TTY::Prompt.new
    end

    def initialize session_user = nil 
        @session_user = session_user
        
    end

   def welcome
    puts "\nWelcome to the 303-MTB Trail Finder App!\n\n"
    set_user
   end

   def set_user
    puts "Sign up / Sign In -- Enter username"
    name = gets.chomp
    self.session_user = User.find_or_create_by( name: name )
    system("clear")
    greet
    end

    def greet
        puts "Welcome #{session_user.name}!\n"
        main_menu
    end

    def main_menu
        choices = ["Find a New Trail to Ride", "View Your Saved Trails", "Browse All Trails",]
        prompt.multi_select("What would you like to do today?", choices)
    end
end