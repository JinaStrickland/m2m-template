require_relative '../config/environment.rb'

# create test data/variables here

christina = Person.new("Christina")
sanam = Person.new("Sanam")
matine = Person.new("Matine")
mansour = Person.new("Mansour")

Person.all

knitting = Hobby.new("knitting", 10)
chess = Hobby.new("chess", 10)
tennis = Hobby.new("tennis", 300)
travel = Hobby.new("travel", 100)

christina_hobby = PersonHobby.new(christina, knitting, 1)
christina_hobby2 = PersonHobby.new(christina, knitting, 2)
sanam_hobby = PersonHobby.new(sanam, chess, 3)
matine_hobby = PersonHobby.new(matine, travel, 4)
mansour_hobby = PersonHobby.new(mansour, travel, 4)

knitting.find_all_people

puts "All people who like travel:"
print travel.find_all_people
puts "\n"

puts "The number of people who like travel:"
print travel.likes

puts "The most popular hobby:"
print Hobby.most_popular.name

puts "Christina's hobbies:"
print christina.hobbies
puts "\n"
puts "Christina's calories burned:"
print christina.total_calories_burned

puts "Who burned the most calories?"
print Person.most_calories_burned

puts "\n"
puts "How many total calories Christina burned knitting:"
print christina.total_calories_per_hobby(knitting)
#binding.pry
0