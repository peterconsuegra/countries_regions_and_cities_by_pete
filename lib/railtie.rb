#require 'countries_regions_and_cities_by_peterconsuegra'
#require 'rails'

module CountriesRegionsAndCitiesByPete
  class Railtie < Rails::Railtie
    railtie_name :countries_regions_and_cities_by_pete

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/*.rake").each { |f| load f }
    end
  end
end