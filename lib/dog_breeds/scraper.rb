class DogBreeds::Scraper

  def get_page
    page_numbers = (1..23).to_a
    page_numbers.each do |page_number|
    Nokogiri::HTML(open("https://www.akc.org/dog-breeds/page/#{page_number}"))
  end

  def scrape_breeds_index
     self.get_page.css("div.breed-type-card")
  end

  def make_dog_breeds
    scrape_restaurants_index.each do |dog_breed|
      WorldsBestRestaurants::Restaurant.new_from_index_page(dog_breed)
    end
  end
end
