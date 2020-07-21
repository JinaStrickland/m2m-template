class Cohort_Hobby

@@all = []

attr_accessor :person, :hobby

def initialize(person, hobby, hours)
    @person = person
    @hobby = hobby
    @hours = hours
    @@all << self
end

def self.all
    @@all
end

end