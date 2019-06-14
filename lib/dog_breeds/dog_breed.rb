class DogBreeds::DogBreed

  attr_accessor :name, :temperament, :popularity, :height, :weight, :life_expectancy, :nutrition, :grooming, :exercise, :training, :health, :summary

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

  def temperament
    @temperament ||= doc.css('div.breed-hero .panel-flex__aside span')[1].text
  end

  def popularity
    @popularity ||= scrape_breed_info[:popularity]
  end

  # def height
  #   @height ||= scrape_breed_info[:height]
  # end

  # def weight
  #   @weight ||= scrape_breed_info[:weight]
  # end

  # def life_expectancy
  #   @life_expectancy ||= scrape_breed_info[:life_expectancy]
  # end

  # def nutrition
  #   @nutrition ||= scrape_breed_info[:nutrition]
  # end

  # def grooming
  #   @grooming ||= scrape_breed_info[:grooming]
  # end

  # def exercise
  #   @exercise ||= scrape_breed_info[:exercise]
  # end

  # def training
  #   @training ||= scrape_breed_info[:training]
  # end

  # def health
  #   @health ||= scrape_breed_info[:health]
  # end

  # def summary
  #   @summary ||= doc.css('div.breed-hero__footer').text.strip
  # end

  def doc
    @doc ||= Nokogiri::HTML(open("https://www.akc.org/dog-breeds/#{self.name.gsub(/\s+/, '-')}/"))
    #is this the same as the URL?
  end

  def scrape_breed_info

    details_array = []
    new_array = []
    new_info_array = []
    breed_info = {}


      info = doc.css('div.panel-flex__aside > ul > li').each do |li|
        long_details = li.css('span').text.strip
        details = long_details.slice(0..(long_details.index('group')))

         details_array << "#{details}"

         details_array.each do |string|
           new_array << string.split(":")

           new_array.each do |traits_array|
             traits_array.each do |traits|

             if traits.include?("inches")
               breed_info[:height] = traits
             elsif traits.include?("Ranks")
               breed_info[:popularity] = traits
             elsif traits.include?("pounds")
               breed_info[:weight] = traits
             elsif traits.include?("years")
               breed_info[:life_expectancy] = traits


              new_info = doc.css('div.tabs__tab-panel-content p').each do |thing|
                new_details = thing.text.strip
                new_info_array << new_details

                new_info_array.each do |new_traits|

                  if new_traits.include?("dog food")
                    breed_info[:nutrition] = new_traits
                  elsif new_traits.include?("coat")
                    breed_info[:grooming] = new_traits
                  elsif new_traits.include?("exercise")
                    breed_info[:exercise] = new_traits
                  elsif new_traits.include?("train")
                    breed_info[:training] = new_traits
                  elsif new_traits.include?("health")
                    breed_info[:health] = new_traits
                  end
                end
              end
            end
          end
        end
      end
    end
         breed_info
         binding.pry
  end




end
