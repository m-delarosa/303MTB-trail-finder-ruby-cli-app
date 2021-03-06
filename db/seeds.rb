# require_relative '../config/environment'
UserTrail.destroy_all
User.destroy_all
Trail.destroy_all


#users
mike = User.create(name: "Mike")
nick = User.create(name: "Nick")

#trails
#denver
apex = Trail.create(name: "Apex Park Tour", location: "Denver", length: 9, difficulty: "Difficult", style: "Enduro")
north_table = Trail.create(name: "North Table Loop", location: "Denver", length: 8, difficulty: "Intermediate", style: "Cross Country")
dakota = Trail.create(name: "Dakota Ridge", location: "Denver", length: 8, difficulty: "Difficult", style: "Enduro")
green_mountain_novice = Trail.create(name: "Green Mountain Novice Loop", location: "Denver", length: 7, difficulty: "Novice", style: "Cross Country")
green_mountain_intermediate = Trail.create(name: "Green Mountain Intermediate Loop", location: "Denver", length: 9, difficulty: "Intermediate", style: "Cross Country")
front_40 = Trail.create(name: "Front Range 40", location: "Denver", length: 42, difficulty: "Expert", style: "Cross Country")
idaho_springs = Trail.create(name: "Idaho Springs (Secret Trails)", location: "Denver", length: 8, difficulty: "Expert", style: "Downhill")

#boulder
betasso = Trail.create(name: "Betasso Preserve", location: "Boulder", length: 8, difficulty: "Intermediate", style: "Cross Country")
walker = Trail.create(name: "Walker Ranch", location: "Boulder", length: 8, difficulty: "Difficult", style: "Enduro")
marshall = Trail.create(name: "Marshall Mesa", location: "Boulder", length: 11, difficulty: "Novice", style: "Cross Country")
west_mag = Trail.create(name: "West Magnolia", location: "Boulder", length: 8, difficulty: "Intermediate", style: "Trail")
heil = Trail.create(name: "Heil Valley Ranch", location: "Boulder", length: 8, difficulty: "Intermediate", style: "Trail")
indian_peaks = Trail.create(name: "Indian Peaks Traverse", location: "Boulder", length: 71, difficulty: "Expert", style: "Cross Country")
left_hand = Trail.create(name: "Left Hand OHV", location: "Boulder", length: 8, difficulty: "Expert", style: "Downhill")

#usertrails
user_trail1 = UserTrail.create(user: mike, trail: apex)
user_trail2 = UserTrail.create(user: nick, trail: walker)
user_trail3 = UserTrail.create(user: mike, trail: heil)

# binding.pry
