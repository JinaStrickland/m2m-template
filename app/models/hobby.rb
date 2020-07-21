class Hobby

    attr_accessor :name, :calories_burned

    @@all = []

    def initialize(name, calories_burned)
        @name = name
        @calories_burned = calories_burned
        @@all << self
    end

    def self.all
        @@all
    end

    #Find which people like a certain hobby
    def find_all_people
        all_pairs = Cohort_Hobby.all.select do |pair|
            pair.hobby == self
        end
        all_pairs.map do |pair|
            pair.person 
        end  
    end

    #Find how many people like a certain hobby
    def likes
        self.find_all_people.length
    end

    #Find which hobbies are the most popular
    def self.most_popular
        hobby_likes = self.all.max_by do |hobby|
            hobby.likes
        end
    end



end