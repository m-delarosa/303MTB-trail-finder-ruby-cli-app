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
        response = prompt.select("What would you like to do today?", choices)
        if (response  == "Find a New Trail to Ride")
            find_trail
        elsif (response == "View Your Saved Trails")
            saved_trails
        else view_all_trails
        end
    end

    def find_trail
        puts "Starts find trail"
    end

    def saved_trails
        puts "Views saved trails"
    end

    def view_all_trails
        system("clear")
        response = prompt.select("Please choose a city.", ["Boulder", "Colorado Springs", "Denver", "Go Back"])
        if (response == "Boulder")
            show_boulder_trails
        elsif (response == "Denver")
            show_denver_trails
        end
    end

    def show_boulder_trails
        system("clear")
        binding.pry
        boulder_trails = Trail.where(location: "Boulder")
        choices = (boulder_trails.map {|trail| trail.name}) << "Back"
        response = prompt.select("Pick a trail.", choices )
        # if (response == "")
    end
end