class DogBreeds::CountryOfOrigin
  
  @@all = []
  
  attr_accessor :name, :breeds 
  
  def initialize(name)
    @name = name 
    @@all << self
    @breeds = []
  end

  def self.all 
    @@all
  end
  
  def dog_breeds(dog_breed)
    dog_breed.country_of_origin=(self.all.sample.name) 
    @breeds < dog_breed
  end
  
end