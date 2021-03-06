class DogBreeds::DogBreed

  attr_accessor :name, :temperament, :akc_breed_popularity, :height, :weight, :life_expectancy, :group, :nutrition, :grooming, :exercise, :training, :health, :summary

  @@all = []

  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  
  def self.find(id)
    self.all[id-1]
  end

  def summary
    @summary = doc.css('div.breed-hero__footer').text.strip
  end
  
  
  def doc
    @doc = Nokogiri::HTML(open("https://www.akc.org/dog-breeds/#{self.name.gsub(/\s+/, '-')}/"))
  end

  def scrape_breed_info

    breed_info = {}


 doc.css('ul.attribute-list > li.attribute-list__row').collect do |li|
    text = li.children.text.strip.split("\n")
    text.each_slice(2) do |header, info|
      if header != nil && info != nil
    breed_info[header.downcase.gsub(":","").to_sym] = info.strip
      


    doc.css('#breed-care div.tabs__panel-wrap').collect do |infos|
      texts = infos.children.text.strip.split("\n").reject{|str| str.strip.empty?}
      texts.each_slice(2) do |key, value| 
        if key != nil && value != nil
       breed_info[key.strip.downcase.to_sym] = value.strip 
            end
	        end
	      end
      end
    end
  end
          breed_info
       
  end
  
  
def get_info
    scrape_breed_info.each do |trait, desc|
       self.send("#{trait.to_s.gsub(" ", "_")}=", desc) if self.respond_to?("#{trait.to_sym}=")
  end
end

end