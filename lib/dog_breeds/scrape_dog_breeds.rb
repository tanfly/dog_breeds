class DogBreeds::ScrapeDogBreeds
  
  def scrape_breed_elements
    dog_breed_elements = []

    page_numbers = (1..23).to_a
    page_numbers.each do |page_number|

       doc = Nokogiri::HTML(open("https://www.akc.org/dog-breeds/page/#{page_number}"))
       dog_breed_rough_scrape = doc.css('div.breed-type-card')
       dog_breed_rough_scrape.each do |dog_breed_element|
         dog_breed_elements << dog_breed_element
    end
  end
    dog_breed_elements
end


  def make_dog_breeds
    scrape_breed_elements.each do |dog_breed_element|
       dog_breed = dog_breed_element.css("h3.breed-type-card__title").text
         DogBreeds::DogBreed.new(dog_breed)
    end
  end




end
