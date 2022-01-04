require_relative '../peterconsuegra_recipes'
require 'colorize'

#bundle exec rake 'install_countries_regions_and_cities_by_pete[model]'

desc 'install countries_regions_and_cities required files'
task :install_countries_regions_and_cities_by_pete, [:model] do |t, args|
  
  #Require all models
  Dir.glob("#{Rails.root}/app/models/*.rb").each { |file| require file }
  
  #Base routes
  rails_app_folder = Dir.pwd 
  gem_folder = File.expand_path('../../../.', __FILE__)
  src_folder="#{gem_folder}/templates/"
  
  #Get scaffold vars
  hash = PeterConsuegraRecipes::get_scaffold_vars(args[:model])
  
  #Adding partials  
  PeterConsuegraRecipes::move_templates(src_folder,"#{rails_app_folder}/app/views/shared/",["_city_select_by_pete.html.erb","_country_select_by_pete.html.erb","_region_select_by_pete.html.erb"])
  
  #Adding concern file
  PeterConsuegraRecipes::move_template(src_folder,"#{rails_app_folder}/app/controllers/concerns/","globalization_by_pete.rb")
    
  #Adding js asset
  PeterConsuegraRecipes::move_template(src_folder,"#{rails_app_folder}/public/countries_regions_and_cities_by_pete/","jquery-3.6.0.min.js")
    
  #Adding route
  PeterConsuegraRecipes::add_route(hash['base_route'],"get_regions","get")
  PeterConsuegraRecipes::add_route(hash['base_route'],"get_cities","get")
    
  #Adding concern to controller
  PeterConsuegraRecipes::add_concern_to_controller("include GlobalizationByPete\n",hash['controller_file'],hash['controller_class'])
  
  #Adding country, region and city fields
  puts "Running command:".blue
  puts "rails generate migration AddFieldsTo#{hash['model_class']} country:string region:string city:string".green
  `rails generate migration AddFieldsTo#{hash['model_class']} country:string region:string city:string`
  sleep 2
  puts "Running command:".blue
  puts "rake db:migrate".green
  `rake db:migrate`
  
  #Print necessary code 
  puts "-----------------------------------------".red
  puts "Copy and paste this code in your project".red
  puts "-----------------------------------------".red
  puts "Add jQuery to your layout file:".red
  puts "<script src='/countries_regions_and_cities_by_pete/jquery-3.6.0.min.js'></script>".red
  puts "Add these partials to your _form.html.erb file:".red
  
  puts '<div class="field" id="country_field">
  <%= render partial: "shared/country_select_by_pete", locals: {model: form.object.class.name, label: "Country", selected: form.object.country} %>
  </div>'.red

  puts '<div class="field" id="region_field">
  <%= render partial: "shared/region_select_by_pete", locals: {model: form.object.class.name, label: "Region / State", selected_country: form.object.country, selected: form.object.region} %>
  </div>'.red

  puts ' <div class="field" id="city_field">
  <%= render partial: "shared/city_select_by_pete", locals: {model: form.object.class.name, label: "City", selected_region: form.object.region, selected_country: form.object.country, selected: form.object.city} %>
  </div>'.red
  puts "Allow :city, region and :country params in your controller #{hash['controller_file']}:".red
  puts "params.require(:#{hash['model'].downcase}).permit(:city, :region, :country)".red
  
end
