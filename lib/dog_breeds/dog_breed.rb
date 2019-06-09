class DogBreeds::DogBreed

  attr_accessor :name, :temperament, :popularity, :height, :weight, :life_expectancy, :nutrition, :grooming, :exercise, :training, :health, :summary

  @@all = []

  def self.new_from_index_page(dog_breed)
    self.new(dog_breed.css("h3.breed-type-card__title").text)
  end

  def initialize(name=nil, url=nil, location=nil, position=nil)
    @name = name
    @url = url
    @location = location
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def best_dish
    @best_dish ||= doc.css("div.c-4.nr.nt ul:nth-child(8) li").text
    # @best_dish ||= doc.xpath("//div[@class='c-4 nr nt']/ul[3]/li").text
  end

  def food_style
    @food_style ||= doc.css("div.c-4.nr.nt ul:nth-child(6) li").text
    # @food_style ||= doc.xpath("//div[@class='c-4 nr nt']/ul[2]/li").text
  end

  def contact
    @contact ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(1)").text.split("+").join(". Tel: +")
    # @contact ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[1]").text.split("+").join(". Tel: +")
  end

  def head_chef
    @head_chef ||= doc.css("div.c-4.nr.nt ul:nth-child(3) li").text.split(" (pictured)").join("")
    # @head_chef ||= doc.xpath("//div[@class='c-4 nr nt']/ul[1]/li").text.split(" (pictured)").join("")
  end

  def website_url
    @website_url ||= doc.css("div.c-4.nr.nt ul:nth-child(10) li:nth-child(2) a").text
    # @website_url ||= doc.xpath("//div[@class='c-4 nr nt']/ul[4]/li[2]/a").text
  end

  def description
    @description ||= doc.css("div.c-8.nl.nt > p:nth-child(6)").text
    # @description ||= doc.xpath("//div[@class='c-8 nl nt']/p[3]").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
