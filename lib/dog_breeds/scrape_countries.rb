class DogBreeds::ScrapeCountries
  
  def make_countries
    countries = [ "North Ilandtic", "Liwanma", "Brie", "New Bamivo", "Sergoda", "Matu", "Eritu", "Rados", "Malebabu Land", "Sodaand"]
    countries.each {|country| DogBreeds::CountryOfOrigin.new(country)}
  end
  
end