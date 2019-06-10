class DogBreeds::CLI

  def call
    DogBreeds::Scraper.new.make_dog_breeds
    puts "Welcome to the Dog Breed Info App!"
    start
  end

  def start
    puts ""
    puts "Which number dog breeds would you like to see? 1-34, 35-68, 36-102, 103-136, 137-170, 171-204, 205-238, or 239-272?"
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
    puts ""
    puts ""
    puts ""
    puts "+_+_+_+_+_ #{dog_breed.name} +_+_+_+_+_+_+_"
    puts ""
    puts ""
    puts " -*-*-*-*-*-*-*-* Summary -*-*-*-*-*-*-*-*- "
    puts " >>>>>> #{dog_breed.summary}"
    puts ""
    puts "+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_"
    puts ""
    puts "Temperament:           #{dog_breed.temperament}"
    puts "Popularity:            #{dog_breed.popularity}"
    puts "Height:                #{dog_breed.height}"
    puts "Weight:                #{dog_breed.weight}"
    puts "Life Expectancy:       #{dog_breed.life_expectancy}"
    puts "Nutrition:"
    puts ">>>>>> #{dog_breed.nutrition}"
    puts ""
    puts "Grooming:"
    puts ">>>>>> #{dog_breed.grooming}"
    puts ""
    puts "Exercise:"
    puts ">>>>>> #{dog_breed.exercise}"
    puts ""
    puts "Training:"
    puts ">>>>>> #{dog_breed.training}"
    puts ""
    puts "Health:"
    puts ">>>>>> #{dog_breed.health}"
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
