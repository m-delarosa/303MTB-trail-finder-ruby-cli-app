require "tty-prompt"

class Cli
    attr_accessor :session_user

    def prompt
        TTY::Prompt.new
    end

    def initialize session_user = nil 
        @session_user = session_user
        
    end

    def logo
            puts '                                               _' 
            puts '                 ___                          (_)'                                                           
            puts '               _/XXX\ '                                                           
            puts '_             /XXXXXX\_                                    __'                                                           
            puts 'X\__    __   /X XXXX XX\                          _       /XX\__      ___'                                                           
            puts '    \__/  \_/__       \ \               _       _/X\__   /XX XXX\____/XXX\ '                                                           
            puts ' ___/   \__/   \ \__   \ \__           /  \_//  _ _ \  \     __  /  \____//'                                                           
            puts '/  __    \  /     \ \_   _//_\___     _/    //           \___/  \/     __/'                                                           
            puts '__/_______\________\__\_/________\_ _/_____/_____________/_______\____/_______'                                                           
            puts '                                  /|\ '                                                           
            puts '                                 / | \ '                                                           
            puts '                                /  |  \ '                                                           
            puts '                               /   |   \ '                                                           
            puts '                              /    |    \ '                                                           
            puts '                             /     |     \ '                                                           
            puts '                            /      |      \ '                                                           
            puts '                           /       |       \ '                                                           
            puts '                          /        |        \ '                                                           
            puts '                         /         |         \ '                                                           
            puts ' ____ __ ____  __  __ _____ ___   _____         _ _   ___ _         _'   
            puts '|__ //  \__ / |  \/  |_   _| _ ) |_   _| _ __ _(_) | | __(_)_ _  __| |___ _ _ '                                                        
            puts ' |_ \ () |_ \ | |\/| | | | | _ \   | || |_/ _` | | | | _|| | | \/ _` / -_) _|'                                                        
            puts '|___/\__/___/ |_|  |_| |_| |___/   |_||_| \__,_|_|_| |_| |_|_||_\__,_\___|_|  '                                                        
                                                                   
    end

   def welcome
    system("clear")
    logo
    puts "\nWelcome to the 303MTB Trail Finder App!\n\n"
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
        system("clear")
        location_r = prompt.select("Where would you like to ride today?", ["Boulder", "Denver"])
        system("clear")
        puts "Awesome, so you'd like to ride in #{location_r}."
        difficulty_r = prompt.select("How much of a challenge are you looking for?", ["Novice", "Intermediate", "Difficult", "Expert"])
        system("clear")
        puts "MMmmmm, SPICY!"
        style_r = prompt.select("What's your riding style?", ["Cross Country", "Trail", "Enduro" , "Downhill"])
        #remember to add if/else with funny comments on their choice
        system("clear")
        length_r = prompt.select("How long of a ride (miles) are we talking?", ["<10 miles", "11 - 15 miles", "16-20 miles", "21-30 miles", "How about a Frickin Epic!?"])
        # if length_r = 
        system("clear")
        trail_reco = Trail.where(location: location_r).where(difficulty: difficulty_r).where(style: style_r).first
        trail_reco2 = Trail.where(location: location_r).where(difficulty: difficulty_r).where(style: style_r).second
        # binding.pry
        if (trail_reco != []) && (session_user.trails.include?(trail_reco) == false ) && (trail_reco != nil)
            puts "You should defintely check out: #{trail_reco.name}!"
            response = prompt.yes?('Would you like to see more details about it now?')
            if response
                if (trail_reco.name == "Betasso Preserve")
                    display_betasso
                elsif (trail_reco.name == "Walker Ranch")
                    display_walker
                elsif (trail_reco.name == "Marshall Mesa")
                    display_marshall
                elsif (trail_reco.name == "West Magnolia")
                    display_magnolia
                elsif (trail_reco.name == "Heil Valley Ranch")
                    display_heil
                elsif (trail_reco.name == "Apex Park Tour")
                    display_apex
                elsif (trail_reco.name == "North Table Loop")
                    display_table
                elsif (trail_reco.name == "Dakota Ridge")
                    display_dakota
                elsif (trail_reco.name == "Green Mountain Novice Loop")
                    display_gm_novice
                elsif (trail_reco.name == "Green Mountain Intermediate Loop")
                    display_gm_intermediate
                elsif (trail_reco.name == "Left Hand OHV")
                    display_left_hand
                elsif (trail_reco.name == "Indian Peaks Traverse")
                    display_indian_peaks
                elsif (trail_reco.name == "Idaho Springs (Secret Trails)")
                    display_idaho_springs 
                elsif (trail_reco.name == "Front Range 40")
                    display_front_40  
                else puts "Trail was not found. Return to main menu." 
                    gets 
                    main_menu
                end
            else main_menu   
            end
        elsif (session_user.trails.include?(trail_reco) == true) && (trail_reco2 != nil) && (trail_reco2 != [])
            puts "You should defintely check out: #{trail_reco2.name}!"
            response = prompt.yes?('Would you like to see more details about it now?')
            if response
                if (trail_reco2.name == "Betasso Preserve")
                    display_betasso
                elsif (trail_reco2.name == "Walker Ranch")
                    display_walker
                elsif (trail_reco2.name == "Marshall Mesa")
                    display_marshall
                elsif (trail_reco2.name == "West Magnolia")
                    display_magnolia
                elsif (trail_reco2.name == "Heil Valley Ranch")
                    display_heil
                elsif (trail_reco2.name == "Apex Park Tour")
                    display_apex
                elsif (trail_reco2.name == "North Table Loop")
                    display_table
                elsif (trail_reco2.name == "Dakota Ridge")
                    display_dakota
                elsif (trail_reco2.name == "Green Mountain Novice Loop")
                    display_gm_novice
                elsif (trail_reco2.name == "Green Mountain Intermediate Loop")
                    display_gm_intermediate
                elsif (trail_reco2.name == "Left Hand OHV")
                    display_left_hand
                elsif (trail_reco2.name == "Indian Peaks Traverse")
                    display_indian_peaks
                elsif (trail_reco2.name == "Idaho Springs (Secret Trails)")
                    display_idaho_springs 
                elsif (trail_reco2.name == "Front Range 40")
                    display_front_40  
                else puts "A new trail was not found. Return to main menu." 
                    gets 
                    main_menu
                end
            end   
        else 
            response = prompt.yes?('Hmm, no luck, want to give it another try?')
            if response
                find_trail
            else main_menu
            end
        end
    end

    def saved_trails
        
        # UserTrail.all.select {|usertrail| usertrail.user_id == session_user.id}
        system("clear")
        user_saved_trails = UserTrail.where(user: session_user)
        choices = user_saved_trails.map {|usertrail| usertrail.trail.name} << "Go Back"
        response = prompt.select("Select a saved trail below to view:", choices)
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
        elsif (response == "Apex Park Tour")
            display_apex
        elsif (response == "North Table Loop")
            display_table
        elsif (response == "Dakota Ridge")
            display_dakota
        elsif (response == "Green Mountain Novice Loop")
            display_gm_novice
        elsif (response == "Green Mountain Intermediate Loop")
            display_gm_intermediate
        elsif (response == "Left Hand OHV")
            display_left_hand
        elsif (response == "Indian Peaks Traverse")
            display_indian_peaks
        elsif (response == "Idaho Springs (Secret Trails)")
            display_idaho_springs 
        elsif (response == "Front Range 40")
            display_front_40  
        else main_menu
        end
        # binding.pry
    end

    def view_all_trails
        system("clear")
        response = prompt.select("Please choose a city.", ["Boulder", "Denver", "Go Back"])
        if (response == "Boulder")
            show_boulder_trails
        elsif (response == "Denver")
            show_denver_trails
        else main_menu
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
        elsif (response == "Left Hand OHV")
            display_left_hand
        elsif (response == "Indian Peaks Traverse")
            display_indian_peaks
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
        elsif (response == "Idaho Springs (Secret Trails)")
            display_idaho_springs 
        elsif (response == "Front Range 40")
            display_front_40     
        else view_all_trails
        end
    end

    #trail pages start here
    def display_apex
        system("clear")
        apex = Trail.all.find_by(name: "Apex Park Tour")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{apex.name}\nLength: #{apex.length} Miles\nDifficulty: #{apex.difficulty}\nStyle: #{apex.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == apex.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: apex.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to the Denver trails."
                gets
                show_denver_trails
            else show_denver_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end

    def display_table
        system("clear")
        table = Trail.all.find_by(name: "North Table Loop")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{table.name}\nLength: #{table.length} Miles\nDifficulty: #{table.difficulty}\nStyle: #{table.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == table.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: table.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to the Denver trails."
                gets
                show_denver_trails
            else show_denver_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end

    def display_dakota
        system("clear")
        dakota = Trail.all.find_by(name: "Dakota Ridge")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{dakota.name}\nLength: #{dakota.length} Miles\nDifficulty: #{dakota.difficulty}\nStyle: #{dakota.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == dakota.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: dakota.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to the Denver trails."
                gets
                show_denver_trails
            else show_denver_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end

    def display_gm_novice
        system("clear")
        gm_novice = Trail.all.find_by(name: "Green Mountain Novice Loop")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{gm_novice.name}\nLength: #{gm_novice.length} Miles\nDifficulty: #{gm_novice.difficulty}\nStyle: #{gm_novice.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == gm_novice.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: gm_novice.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to the Denver trails."
                gets
                show_denver_trails
            else show_denver_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end

    def display_gm_intermediate
        system("clear")
        gm_intermediate = Trail.all.find_by(name: "Green Mountain Intermediate Loop")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{gm_intermediate.name}\nLength: #{gm_intermediate.length} Miles\nDifficulty: #{gm_intermediate.difficulty}\nStyle: #{gm_intermediate.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == gm_intermediate.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: gm_intermediate.id)
                puts "Your trail has been sucessfuly deleted. Press enter to return to Denver trails."
                gets
                show_denver_trails
            else show_denver_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end
    
    def display_front_40
        system("clear")
        front_40 = Trail.all.find_by(name: "Front Range 40")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{front_40.name}\nLength: #{front_40.length} Miles\nDifficulty: #{front_40.difficulty}\nStyle: #{front_40.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == front_40.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: front_40.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to the Denver trails."
                gets
                show_denver_trails
            else show_denver_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
            if response == true
                UserTrail.find_or_create_by(user: session_user, trail: front_40)
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
    end

    def display_idaho_springs
        system("clear")
        idaho_springs = Trail.all.find_by(name: "Idaho Springs (Secret Trails)")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{idaho_springs.name}\nLength: #{idaho_springs.length} Miles\nDifficulty: #{idaho_springs.difficulty}\nStyle: #{idaho_springs.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == idaho_springs.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: idaho_springs.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to the Denver trails."
                gets
                show_denver_trails
            else show_denver_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
            if response == true
                UserTrail.find_or_create_by(user: session_user, trail: idaho_springs)
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
    end

    #boulder trails start here
    def display_betasso
        system("clear")
        betasso = Trail.all.find_by(name: "Betasso Preserve")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{betasso.name}\nLength: #{betasso.length} Miles\nDifficulty: #{betasso.difficulty}\nStyle: #{betasso.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == betasso.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: betasso.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to Boulder trails."
                gets
                show_boulder_trails
            else show_boulder_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end

    def display_walker
        system("clear")
        walker = Trail.all.find_by(name: "Walker Ranch")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{walker.name}\nLength: #{walker.length} Miles\nDifficulty: #{walker.difficulty}\nStyle: #{walker.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == walker.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: walker.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to Boulder trails."
                gets
                show_boulder_trails
            else show_boulder_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end

    def display_marshall
        system("clear")
        marshall = Trail.all.find_by(name: "Marshall Mesa")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{marshall.name}\nLength: #{marshall.length} Miles\nDifficulty: #{marshall.difficulty}\nStyle: #{marshall.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == marshall.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: marshall.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to Boulder trails."
                gets
                show_boulder_trails
            else show_boulder_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end

    def display_magnolia
        system("clear")
        magnolia = Trail.all.find_by(name: "West Magnolia")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{magnolia.name}\nLength: #{magnolia.length} Miles\nDifficulty: #{magnolia.difficulty}\nStyle: #{magnolia.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == magnolia.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: magnolia.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to Boulder trails."
                gets
                show_boulder_trails
            else show_boulder_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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
    end

    def display_heil
        system("clear")
        heil = Trail.all.find_by(name: "Heil Valley Ranch")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{heil.name}\nLength: #{heil.length} Miles\nDifficulty: #{heil.difficulty}\nStyle: #{heil.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == heil.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: heil.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to Boulder trails."
                gets
                show_boulder_trails
            else show_boulder_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
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

    def display_indian_peaks
        system("clear")
        indian_peaks = Trail.all.find_by(name: "Indian Peaks Traverse")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{indian_peaks.name}\nLength: #{indian_peaks.length} Miles\nDifficulty: #{indian_peaks.difficulty}\nStyle: #{indian_peaks.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == indian_peaks.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: indian_peaks.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to Boulder trails."
                gets
                show_boulder_trails
            else show_boulder_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
            if response == true
                UserTrail.find_or_create_by(user: session_user, trail: indian_peaks)
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

    def display_left_hand
        system("clear")
        left_hand = Trail.all.find_by(name: "Left Hand OHV")
        user_saved_trails = UserTrail.where(user: session_user)
        puts "#{left_hand.name}\nLength: #{left_hand.length} Miles\nDifficulty: #{left_hand.difficulty}\nStyle: #{left_hand.style}"
        if user_saved_trails.all.find {|usertrail| usertrail.trail_id == left_hand.id }
            response = prompt.yes?('Would you like to remove this trail from your hit list?')
            if response
                row_to_delete = UserTrail.where(user_id: session_user.id).where(trail_id: left_hand.id)
                UserTrail.delete(row_to_delete)
                puts "Your trail has been sucessfuly deleted. Press enter to return to Boulder trails."
                gets
                show_boulder_trails
            else show_boulder_trails
            end
        else response = prompt.yes?('Would you like to save this trail?')
            if response == true
                UserTrail.find_or_create_by(user: session_user, trail: left_hand)
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

end