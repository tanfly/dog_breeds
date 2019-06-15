class DogBreeds::CountryOfOrigin
  
  @@all = []
  
  attr_accessor :name, :dogs 
  
  def initilaize(name)
    @name = name 
    @@all << self
    @dogs = []
  end
  
  def self.all 
    @@all
  end
  
end