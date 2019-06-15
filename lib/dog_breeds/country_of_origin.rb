class DogBreeds::CountryOfOrigin
  
  @@all = []
  
  attr_accessor :name, :breeds 
  
  def initilaize(name)
    @name = name 
    @@all << self
    @breeds = []
  end

  def new_from_source(country)
    self.new(country)
  end
  
  def self.all 
    @@all
  end
  
end