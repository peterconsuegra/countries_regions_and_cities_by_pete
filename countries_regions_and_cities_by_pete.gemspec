# frozen_string_literal: true

require_relative "lib/countries_regions_and_cities_by_pete/version"

Gem::Specification.new do |spec|
  spec.name          = "countries_regions_and_cities_by_pete"
  spec.version       = CountriesRegionsAndCitiesByPete::VERSION
  spec.authors       = ["Pedro Consuegra"]
  spec.email         = ["pedroconsuegrat@gmail.com"]

  spec.summary       = "An agile way to implement Countries, Regions and Cities in your project"
  spec.description   = "An agile way to implement Countries, Regions and Cities in your project, without the need to create additional tables"
  spec.homepage      = "https://rubygems.org/gems/countries_regions_and_cities_by_pete"
  
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/peterconsuegra/countries_regions_and_cities_by_pete"
  spec.metadata["changelog_uri"] = "https://github.com/peterconsuegra/countries_regions_and_cities_by_pete/blob/master/CHANGELOG.md"
  spec.license = 'MIT'
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  
  spec.add_dependency("carmen", "~> 1.1.3")
  spec.add_dependency("city-state","~> 0.1.0") 
  spec.add_dependency("colorize","~> 0.8.0") 
  spec.add_dependency("tty-file","~> 0.10.0") 

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
