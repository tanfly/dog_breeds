
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dog_breeds/version"

Gem::Specification.new do |spec|
  spec.name          = "dog_breeds"
  spec.version       = DogBreeds::VERSION
  spec.authors       = ["'Stella McEwen'"]
  spec.email         = ["'mcewen.stella@gmail.com'"]

  spec.summary       = %q{A CLI app that provides information on dog breeds}
  spec.description   = %q{This CLI allows the user to ask about dog breeds, and receive a compendium of info in return, scraped from the AKC website}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
spec.add_development_dependency "rspec"
spec.add_development_dependency "pry"
spec.add_dependency "nokogiri"
end
