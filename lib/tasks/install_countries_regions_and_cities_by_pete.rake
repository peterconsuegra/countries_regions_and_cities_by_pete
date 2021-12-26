require_relative '../peterconsuegra_recipes'
require 'fileutils'
require "tty-file"

#bundle exec rake 'install_countries_regions_and_cities_by_pete[place]'

desc 'install countries_regions_and_cities required files'
task :install_countries_regions_and_cities_by_pete, [:model] do |t, args|

  rails_app_folder = Dir.pwd 
  gem_folder = File.expand_path('../../../.', __FILE__)
  
  model_name = args[:model].capitalize
  model_plural = model_name+"s"
  model_plural = model_plural.capitalize
  model_plural_downcase = model_plural.downcase
  
  #Adding partials
  dest_folder="#{rails_app_folder}/app/views/shared/"
  src_folder="#{gem_folder}/templates/"
  files=["_city_select_by_pete.html.erb","_country_select_by_pete.html.erb","_region_select_by_pete.html.erb"]
  FileUtils.mkdir_p dest_folder
  PeterConsuegraRecipes::move_templates(src_folder,dest_folder,files)
  
  #Adding concern
  dest_folder="#{rails_app_folder}/app/controllers/concerns/"
  file="globalization_by_pete.rb"
  FileUtils.mkdir_p dest_folder
  FileUtils.cp src_folder+file,dest_folder+file
  puts "File copied to: #{dest_folder+file}".green
  
  #Copy jquery-3.6.0.min.js file
  dest_folder="#{rails_app_folder}/public/countries_regions_and_cities_by_pete/"
  file="jquery-3.6.0.min.js"
  FileUtils.mkdir_p dest_folder
  FileUtils.cp src_folder+file,dest_folder+file
  puts "File copied to: #{dest_folder+file}".green
  
  #Adding route to routes.rb
  file="#{rails_app_folder}/config/routes.rb"
  route1 = "get '/#{model_plural_downcase}_get_regions', to: '#{model_plural_downcase}#get_regions'"
  route2 = "get '/#{model_plural_downcase}_get_cities', to: '#{model_plural_downcase}#get_cities'"
  PeterConsuegraRecipes::append_before_last_appearance_of("end",route1,file)
  PeterConsuegraRecipes::append_before_last_appearance_of("end",route2,file)
  puts "Adding route: #{route1}".blue
  puts "Adding route: #{route2}".blue
  
  #Adding include GlobalizationByPete in Controller
  file="#{rails_app_folder}/app/controllers/#{model_plural_downcase}_controller.rb"
  code="include GlobalizationByPete\n"
  TTY::File.inject_into_file file, code, after: "class #{model_plural}Controller < ApplicationController\n"
  puts "Adding concern to controller #{file}: include GlobalizationByPete".blue
  
  `rails generate migration AddFieldsTo#{model_name} country:string region:string city:string`
  sleep 2
  `rake db:migrate`
  
  #Print necessary code 
  puts "-----------------------------------------".red
  puts "Copy and paste this code in your project".red
  puts "-----------------------------------------".red
  puts "Add jQuery to your layout file:".red
  puts "<script src='/countries_regions_and_cities_by_pete/jquery-3.6.0.min.js'></script>".red
  puts "Add these partials to your _form.html.erb file:".red
  
  puts '<div class="field" id="country_field">
  <%= render partial: "shared/country_select_by_pete", locals: {model: form.object.class.name.downcase, label: "Country", selected: form.object.country} %>
  </div>'.red

  puts '<div class="field" id="region_field">
  <%= render partial: "shared/region_select_by_pete", locals: {model: form.object.class.name.downcase, label: "Region / State", selected_country: form.object.country, selected: form.object.region} %>
  </div>'.red

  puts ' <div class="field" id="city_field">
  <%= render partial: "shared/city_select_by_pete", locals: {model: form.object.class.name.downcase, label: "City", selected_region: form.object.region, selected_country: form.object.country, selected: form.object.city} %>
  </div>'.red
  puts "Allow globalization params in your controller #{model_plural_downcase}_controller:".red
  puts "params.require(:#{model_name}).permit(:city, :region, :country)".red
  
end
