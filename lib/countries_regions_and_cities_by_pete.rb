# frozen_string_literal: true

require_relative "countries_regions_and_cities_by_pete/version"

require 'carmen'
require 'city-state'

module CountriesRegionsAndCitiesByPete
  
 # require 'countries_regions_and_cities_by_peterconsuegra/railtie' if defined?(Rails)
  
  class Error < StandardError; end
  # Your code goes here...
  
  def self.get_all_countries
    return Carmen::Country::all
  end
  
  def self.get_regions(selected_country)
    country = Carmen::Country.coded(selected_country)
    return country.subregions if country
  end
  
  def self.get_cities(selected_region,selected_country)
    CS.cities(selected_region,selected_country)
  end
  
end

require_relative "railtie" if defined?(Rails::Railtie)