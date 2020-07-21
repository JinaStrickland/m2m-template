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

    #Find which hobbies a certain person likes
    def find_hobbies
        pairs = Cohort_Hobby.all.select do |pair|
            pair.person == self
        end
        pairs.map do |pair|
            pair.hobby 
        end
    end


    #Determine how many calories a person burned 
    # by doing one hobby a day
    def total_calories_burned 
        calorie_array = self.find_hobbies.map do |hobby|
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
    # def total_calories_per_hobby(hobby)
    #     binding.pry
    #     my_hobbies = Cohort_Hobby.all.select do |matches|
    #         matches.person == self
    #     end
        # hobby1 = my_hobbies.select do |hobby|
        #     hobby.hobby = hobby
        #end
        
    end

end