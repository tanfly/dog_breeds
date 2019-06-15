class DogBreeds::CountryOfOrigin
  
  @@all = []
  
  attr_accessor :name, :breeds 
  
  def initilaize(name)
    @name = name 
    @@all << self
    @breeds = []
  end

  def self.new_from_source(country)
    self.new(country)
  end
  
  def self.all 
    @@all
  end
  
  def add_dog_breed(dog_breed)
    @@breeds << dog_breed 
    dog_breed.country_of_origin = self
  end
  
end