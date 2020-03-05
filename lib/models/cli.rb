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
        system("clear")
        choices = ["Find a New Trail to Ride", "View Your Saved Trails", "Browse All Trails","Quit and Go Ride!"]
        response = prompt.select("What would you like to do today?", choices)
        if (response  == "Find a New Trail to Ride")
            find_trail
        elsif (response == "View Your Saved Trails")
            saved_trails
        elsif (response == "Browse All Trails")
            view_all_trails
        else
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
        boulder_trails = Trail.where(location: "Boulder")
        choices = (boulder_trails.map {|trail| trail.name}) << "Back"
        response = prompt.select("Pick a trail.", choices )
        if (response == "Betasso Preserve")
            display_betasso
        elsif (response == "Walker Ranch")
            display_walker
        elsif (response == "Marshall Mesa")
            display_marshall
        elsif (response == "West Magnolia")
            display_magnolia
        elsif (response == "Heil Valley Ranch")
            display_heil
        else view_all_trails
        end
    end
    
    def display_betasso
        system("clear")
        betasso = Trail.all.find_by(name: "Betasso Preserve")
        
        puts "#{betasso.name}\nLength: #{betasso.length} Miles\nDifficulty: #{betasso.difficulty}\nStyle: #{betasso.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: betasso)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Boulder Trails now? (nerd)")
            if response == true
                show_boulder_trails
            else main_menu
            end
        else show_boulder_trails
        end
    end

    def display_walker
        system("clear")
        walker = Trail.all.find_by(name: "Walker Ranch")
        
        puts "#{walker.name}\nLength: #{walker.length} Miles\nDifficulty: #{walker.difficulty}\nStyle: #{walker.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: walker)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Boulder Trails now? (nerd)")
            if response == true
                show_boulder_trails
            else main_menu
            end
        else show_boulder_trails
        end
    end

    def display_marshall
        system("clear")
        marshall = Trail.all.find_by(name: "Marshall Mesa")
        
        puts "#{marshall.name}\nLength: #{marshall.length} Miles\nDifficulty: #{marshall.difficulty}\nStyle: #{marshall.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: marshall)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Boulder Trails now? (nerd)")
            if response == true
                show_boulder_trails
            else main_menu
            end
        else show_boulder_trails
        end
    end

    def display_magnolia
        system("clear")
        magnoliadisplay_magnolia = Trail.all.find_by(name: "West Magnolia")
        
        puts "#{magnoliadisplay_magnolia.name}\nLength: #{magnoliadisplay_magnolia.length} Miles\nDifficulty: #{magnoliadisplay_magnolia.difficulty}\nStyle: #{magnoliadisplay_magnolia.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: magnolia)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Boulder Trails now? (nerd)")
            if response == true
                show_boulder_trails
            else main_menu
            end
        else show_boulder_trails
        end
    end

    def display_heil
        system("clear")
        heil = Trail.all.find_by(name: "Heil Valley Ranch")
        
        puts "#{heil.name}\nLength: #{heil.length} Miles\nDifficulty: #{heil.difficulty}\nStyle: #{heil.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: heil)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Boulder Trails now? (nerd)")
            if response == true
                show_boulder_trails
            else main_menu
            end
        else show_boulder_trails
        end
    end
end