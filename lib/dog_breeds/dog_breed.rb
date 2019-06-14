class DogBreeds::DogBreed

  attr_accessor :name, :temperament, :akc_breed_popularity, :height, :weight, :life_expectancy, :group, :nutrition, :grooming, :exercise, :training, :health, :summary

  @@all = []

  def self.new_from_index_page(dog_breed)
    self.new(dog_breed.css("h3.breed-type-card__title").text, dog_breed.css("div.breed-type-card a.attribute href").text)
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
  end

def scrape_breed_info

    @breed_info = {}


 doc.css('ul.attribute-list > li.attribute-list__row').collect do |li|
    text = li.children.text.strip.split("\n")
    text.each_slice(2) do |header, info|
    @breed_info[header.downcase.gsub(":","").to_sym] = info.strip
      if header.include?("temperament" || "popularity" || "height" || "weight" || "life_expectancy")


    doc.css('#breed-care div.tabs__panel-wrap').collect do |infos|
      texts = infos.children.text.strip.split("\n").reject{|str| str.strip.empty?}
      texts.each_slice(2) do |key, value| 
       @breed_info[key.strip.downcase.to_sym] = value.strip if key.include?("nutrition" || "grooming" || "exercise" || "training" || "health")

	 
	        end
	      end
      end
    end
  end
         @breed_info
         binding.pry
  end
  
  
  def get_info
    scrape_breed_info.each do |trait, desc|
       self.send("#{trait.to_s.gsub(" ", "_")}=", desc)
  end
end


end