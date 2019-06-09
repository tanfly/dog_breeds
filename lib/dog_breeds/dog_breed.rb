class DogBreeds::DogBreed

  attr_accessor :name, :temperament, :popularity, :height, :weight, :life_expectancy, :nutrition, :grooming, :exercise, :training, :health, :summary

  @@all = []

  def self.new_from_index_page(dog_breed)
    self.new(dog_breed.css("h3.breed-type-card__title").text, dog_breed.css("div.breed-type-card a.attribute href").text
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

  def temperament
    @temperament ||= doc.css('div.breed-hero .panel-flex__aside span')[1].text
  end

  def summary
    @summary ||= doc.css('div.breed-hero__footer').text.strip

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end


def breed_info

  details_array = []
  new_array = []
  new_info_array = []



    info = doc.css('div.panel-flex__aside > ul > li').each do |li|
      long_details = li.css('span').text.strip
      details = long_details.slice(0..(long_details.index('group')))

       details_array << "#{details}"

       details_array.each do |string|
         new_array << string.split(":")

         new_array.each do |traits_array|
           traits_array.each do |trait|

           if trait.include?("inches")
             self.height = trait
           elsif trait.include?("Ranks")
             self.popularity = trait
           elsif trait.include?("pounds")
             self.weight = trait
           elsif trait.include?("years")
             self.life_expectancy = trait


            new_info = doc.css('div.tabs__tab-panel-content p').each do |thing|
              new_details = thing.text.strip
              new_info_array << new_details

              new_info_array.each do |ntrait|

                if ntrait.include?("food")
                  self.nutrition = ntrait
                elsif ntrait.include?("coat")
                  self.grooming = ntrait
                elsif ntrait.include?("exercise")
                  self.exercise = ntrait
                elsif ntrait.include?("train")
                  self.training = ntrait
                elsif ntrait.include?("health")
                  self.health = ntrait
                end
              end
            end
          end
        end
      end
    end
  end
end
