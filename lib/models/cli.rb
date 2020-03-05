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
        response = prompt.select("Please choose a city.", ["Boulder", "Denver", "Go Back"])
        if (response == "Boulder")
            show_boulder_trails
        elsif (response == "Denver")
            show_denver_trails
        end
    end

    def show_boulder_trails
        system("clear")
        boulder_trails = Trail.where(location: "Boulder")
        choices = (boulder_trails.map {|trail| trail.name}) << "Go Back"
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

    def show_denver_trails
        system("clear")
        denver_trails = Trail.where(location: "Denver")
        choices = (denver_trails.map {|trail| trail.name}) << "Go Back"
        response = prompt.select("Pick a trail.", choices )
        if (response == "Apex Park Tour")
            display_apex
        elsif (response == "North Table Loop")
            display_table
        elsif (response == "Dakota Ridge")
            display_dakota
        elsif (response == "Green Mountain Novice Loop")
            display_gm_novice
        elsif (response == "Green Mountain Intermediate Loop")
            display_gm_intermediate
        else view_all_trails
        end
    end

    def display_apex
        system("clear")
        apex = Trail.all.find_by(name: "Apex Park Tour")
        
        puts "#{apex.name}\nLength: #{apex.length} Miles\nDifficulty: #{apex.difficulty}\nStyle: #{apex.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: apex)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Denver Trails now? (nerd)")
            if response == true
                show_denver_trails
            else main_menu
            end
        else show_denver_trails
        end
    end

    def display_table
        system("clear")
        table = Trail.all.find_by(name: "North Table Loop")
        
        puts "#{table.name}\nLength: #{table.length} Miles\nDifficulty: #{table.difficulty}\nStyle: #{table.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: table)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Denver Trails now? (nerd)")
            if response == true
                show_denver_trails
            else main_menu
            end
        else show_denver_trails
        end
    end

    def display_dakota
        system("clear")
        dakota = Trail.all.find_by(name: "Dakota Ridge")
        
        puts "#{dakota.name}\nLength: #{dakota.length} Miles\nDifficulty: #{dakota.difficulty}\nStyle: #{dakota.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: dakota)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Denver Trails now? (nerd)")
            if response == true
                show_denver_trails
            else main_menu
            end
        else show_denver_trails
        end
    end

    def display_gm_novice
        system("clear")
        gm_novice = Trail.all.find_by(name: "Green Mountain Novice Loop")
        
        puts "#{gm_novice.name}\nLength: #{gm_novice.length} Miles\nDifficulty: #{gm_novice.difficulty}\nStyle: #{gm_novice.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: gm_novice)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Denver Trails now? (nerd)")
            if response == true
                show_denver_trails
            else main_menu
            end
        else show_denver_trails
        end
    end

    def display_gm_intermediate
        system("clear")
        gm_intermediate = Trail.all.find_by(name: "Green Mountain Intermediate Loop")
        
        puts "#{gm_intermediate.name}\nLength: #{gm_intermediate.length} Miles\nDifficulty: #{gm_intermediate.difficulty}\nStyle: #{gm_intermediate.style}"
        response = prompt.yes?('Would you like to save this trail?')
        if response == true
            UserTrail.find_or_create_by(user: session_user, trail: gm_intermediate)
            system("clear")
            puts "Trail Saved Sucessfully! Now Go Ride!"
            response = prompt.yes?("...or would you like to view other Denver Trails now? (nerd)")
            if response == true
                show_denver_trails
            else main_menu
            end
        else show_denver_trails
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