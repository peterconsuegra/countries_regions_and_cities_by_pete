module GlobalizationByPete
  include ActiveSupport::Concern
  
  def get_regions
      selected_country ||= params[:selected_country]
      model ||= params[:model]
      render partial: 'shared/region_select_by_pete', locals: {model: model, label: "Region / State", selected_country: selected_country}
  end
  
  def get_cities
      selected_country ||= params[:selected_country]
      selected_region ||= params[:selected_region]
      model ||= params[:model]
      render partial: 'shared/city_select_by_pete', locals: {model: model, label: "Ciudad", selected_region: selected_region, selected_country: selected_country}
  end
  
end