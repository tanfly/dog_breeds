class DogBreeds::Scraper

  def scrape_breeds
    breeds = []

    page_numbers = (1..23).to_a
    page_numbers.each do |page_number|

       doc = Nokogiri::HTML(open("https://www.akc.org/dog-breeds/page/#{page_number}"))
       dog_breeds = doc.css('div.breed-type-card')
       dog_breeds.each do |dog_breed|
         breeds << dog_breed
    end
  end
    breeds
end

  def make_dog_breeds
    scrape_breeds.each do |dog_breed|
      DogBreeds::DogBreed.new_from_index_page(dog_breed)
    end
  end



end
