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
  
  def add_dog_breed(dog_breed)
    @breeds << dog_breed
    dog_breed.country_of_origin = @@all.sample.name
  end
  
  
end