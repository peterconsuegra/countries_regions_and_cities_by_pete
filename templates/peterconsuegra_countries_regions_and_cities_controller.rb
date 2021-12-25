class PeterconsuegraCountriesRegionsAndCitiesController < ApplicationController
  
  def get_regions
      selected_country ||= params[:selected_country]
      model ||= params[:model]
      render partial: 'shared/peterconsuegra_region_select', locals: {model: model, label: "Region / State", selected_country: selected_country}
  end
  
  def get_cities
      selected_country ||= params[:selected_country]
      selected_region ||= params[:selected_region]
      model ||= params[:model]
      render partial: 'shared/peterconsuegra_city_select', locals: {model: model, label: "Ciudad", selected_region: selected_region, selected_country: selected_country}
  end
  
end