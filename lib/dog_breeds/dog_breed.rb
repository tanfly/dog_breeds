class DogBreeds::DogBreed

  attr_reader :name, :temperament, :popularity, :height, :weight, :life_expectancy, :nutrition, :grooming, :exercise, :training, :health, :summary

  @@all = []
  @@breed_info = {}

  def self.new_from_index_page(dog_breed)
    self.new(dog_breed.css("h3.breed-type-card__title").text, dog_breed.css("div.breed-type-card a.attribute href"))
  end

  def initialize(name = nil, url = nil)
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def summary
    @summary ||= doc.css('div.breed-hero__footer').text.strip
  end

  def doc
    @doc ||= Nokogiri::HTML(open("https://www.akc.org/dog-breeds/#{self.name.gsub(/\s+/, '-')}/"))
    #is this the same as the URL?
  end

  def breed_info_temperament_through_life_expectancy


    doc.css('ul.attribute-list > li.attribute-list__row').collect do |li|
      text = li.children.text.strip.split("\n")
      text.each_slice(2) do |trait, description|
      @@breed_info[trait.downcase.gsub(":","").to_sym] = description.strip
    end
  end
end

      
 
 
  def breed_info_nutrition_through_health 


    doc.css('#breed-care div.tabs__panel-wrap').collect do |li|
      text = li.children.text.strip.split("\n").reject{|str| str.strip.empty?}
      
      text.each_slice(2) do |trait, description| 
       @@breed_info[trait.strip.downcase.to_sym] = description.strip
     end
   end
 end
 
  
  def get_info 
    @@breed_info.each do |trait, description|
   self.send("#{trait.to_s}=", description)
    end
 end






end