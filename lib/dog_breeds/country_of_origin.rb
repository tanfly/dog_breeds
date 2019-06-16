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
  
  def add_dog_breed_from_scrape(dog_breed)
    @@breeds << dog_breed.css("h3.breed-type-card__title").text 
    dog_breed.country_of_origin = self
  end
  
end