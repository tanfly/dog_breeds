Deliverables 

1. Generally refactor/clean up your code so that it's more efficient, we went over how to do most of this but as a reminder:
  - Run the scrape_info method only once per breed 
  - Remove things that don't work anymore like the URL attribute/ the WHOLE Doc attribute in a breed instance, name your methods/variables more appropriately (dog_breed is ACTUALLY dog_breed_element...and not THING :P)

- Then, we're going to create dummy "Country of Origin" data. 
1. Create a class called CountryOfOrigin that is initialized with a name and nothing else. There should be a .all class method that returns all instances of Countries
2. When your app starts right away, create 3 or 4 fake "Countries" right away.
3. Add an attribute CountryOfOrigin to your DogBreed class. 
4. Upon creation of a new DogBreed, associate it with a random CountryOfOrigin using CountryOfOrigin.all.sample 
5. There should also be an instance method #breeds for each CountryOfOrigin  that returns all dogs associated with that Country. 