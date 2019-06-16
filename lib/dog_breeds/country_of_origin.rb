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
  
  def self.new_from_scrape(name)
    self.new(name)
  end
  
  def add_dog_breed(dog_breed)
    @@breeds << dog_breed
    dog_breed.country_of_origin = self
  end
  
   def self.find(name)
    self.all.detect {|country| country.name == name}
  end
  
  def self.create(name)
   country = self.new(name)
  end
  
  def self.find_or_create_by_name(name)
    if self.find(name)
      self.find(name)
    else
      self.create(name)
  end
end

  def print_dog_breeds
    self.breeds.each {|breed| puts breed.name}
    end
  
end