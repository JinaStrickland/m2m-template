class Person

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def person_hobbies
        PersonHobby.all.select do |pair|
            pair.person == self
        end
    end

    #Find which hobbies a certain person likes
    def hobbies
        self.person_hobbies.map do |pair|
            pair.hobby 
        end
    end


    #Determine how many calories a person burned 
    # if only doing one hour of a hobby a day
    # Note for later: update to accommodate if person does
    # more than one hour
    def total_calories_burned 
        calorie_array = self.hobbies.map do |hobby|
            hobby.calories_burned
        end
        calorie_array.inject(0, :+)
    end

    #Determine who burned the most calories
    def self.most_calories_burned
        max_person = self.all.max do |person|
            person.total_calories_burned
        end
        all_max_people = self.all.select do |person|
            person.total_calories_burned == max_person.total_calories_burned
        end
    end

    #Find total calories by hours spent on hobby
    def total_calories_per_hobby(hobby)

       calories = self.person_hobbies.map do |person_hobby|
            if person_hobby.hobby == hobby
                person_hobby.hours * hobby.calories_burned
            end
        end
        calories.reduce(:+)
    end

        #Find all hobbies associated with self
        #all_hobbies = self.person_hobbies.select do |person_hobby|
         #   person_hobby.hobby == hobby
        #end
        #all_hours = all_hobbies.map do |person_hobby|
         #   person_hobby.hours
        #end
       #all_hours.sum * hobby.calories_burned

end