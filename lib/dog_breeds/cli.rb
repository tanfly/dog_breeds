class DogBreeds::CLI

  def call
    DogBreeds::Scraper.new.make_dog_breeds
    puts "Welcome to the Dog Breed Info App!"
    start
  end

  def start
    puts ""
    puts "Which number dog breeds would you like to see?"
    puts "1-34 (A - Berga)"
    puts "35-68 (Berge - Cau)"
    puts "36-102 (Cav - En)"
    puts "103-136 (En - Irish T)"
    puts "137-170 (Irish W - Ned)"
    puts "171-204 (New - Pu)"
    puts "205-238 (Py - So)"
    puts "239-272 (Sp - Y)?"
    puts "(Please enter a number)"
    input = gets.strip.to_i

    show_dog_breeds(input)

    puts ""
    puts "Please enter the number of the dog breed you would like more information on:"
    input = gets.strip

    dog_breed = DogBreeds::DogBreed.find(input.to_i)

    print_dog_breed(dog_breed)

    puts ""
    puts "Would you like to see another dog breed? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thanks for learning about dogs!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      start
    end
  end

  def print_dog_breed(dog_breed)
    dog_breed.get_info 
    puts ""
    puts ""
    puts ""
    puts "+_+_+_+_+_ #{dog_breed.name} +_+_+_+_+_+_+_"
    puts "...........from #{dog_breed.country_of_origin}..............."
    puts ""
    puts ""
    puts " -*-*-*-*-*-*-*-* Summary -*-*-*-*-*-*-*-*- "
    puts " >>>>>> #{dog_breed.summary}"
    puts ""
    puts "+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_"
    puts ""
    puts "Temperament:           #{dog_breed.temperament}" unless dog_breed.temperament == nil
    puts "Popularity:            #{dog_breed.akc_breed_popularity}" unless dog_breed.akc_breed_popularity == nil
    puts "Height:                #{dog_breed.height}" unless dog_breed.height == nil
    puts "Weight:                #{dog_breed.weight}" unless dog_breed.weight == nil
    puts "Life Expectancy:       #{dog_breed.life_expectancy}" unless dog_breed.life_expectancy == nil
    puts "Group:                 #{dog_breed.group}" unless dog_breed.group == nil
    puts ""
    puts "Nutrition:" unless dog_breed.nutrition == nil
    puts "" unless dog_breed.nutrition == nil
    puts "#{dog_breed.nutrition}" unless dog_breed.nutrition == nil
    puts "" unless dog_breed.nutrition == nil
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" unless dog_breed.nutrition == nil
    puts "" unless dog_breed.nutrition == nil
    puts "Grooming:" unless dog_breed.grooming == nil
    puts "" unless dog_breed.grooming == nil
    puts "#{dog_breed.grooming}" unless dog_breed.grooming == nil
    puts "" unless dog_breed.grooming == nil
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" unless dog_breed.grooming == nil
    puts "" unless dog_breed.grooming == nil
    puts "Exercise:" unless dog_breed.exercise == nil
    puts "" unless dog_breed.exercise == nil
    puts "#{dog_breed.exercise}" unless dog_breed.exercise == nil
    puts "" unless dog_breed.exercise == nil
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" unless dog_breed.exercise == nil
    puts "" unless dog_breed.exercise == nil
    puts "Training:" unless dog_breed.training == nil
    puts "" unless dog_breed.training == nil
    puts "#{dog_breed.training}" unless dog_breed.training == nil
    puts "" unless dog_breed.training == nil
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" unless dog_breed.training == nil
    puts "" unless dog_breed.training == nil
    puts "Health:" unless dog_breed.health == nil
    puts "" unless dog_breed.health == nil
    puts "#{dog_breed.health}" unless dog_breed.health == nil
    puts ""
  end


  def show_dog_breeds(input)
    puts ""
    puts "---------- Dog Breeds #{input} - #{input+33} ----------"
    puts ""
    DogBreeds::DogBreed.all[input-1, 34].each.with_index(input) do |dog_breed, index|
      puts "#{index}. #{dog_breed.name}"
    end
  end

end
