# Ruby On Rails Countries, Regions and Cities by Pete

An agile way to implement Countries, Regions, and Cities in a Ruby On Rails scaffold without the need to create additional tables

## Support

Ruby On Rails: 5, 6, 7

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'countries_regions_and_cities_by_pete'
```

And then execute:

    $ bundle install


## Usage
Let's create a example for a Place scaffold:

1. Let's create a new rails app:

```ruby
rails new myapp 
```

2. Create the database:

```ruby
bundle exec rake db:create
```

3. Go to the application directory in Terminal and run the following command to create a scaffold for the Place model:

```ruby
bundle exec rails g scaffold Place name:string description:text
```

4. Add this line to your application's Gemfile:

```ruby
gem 'countries_regions_and_cities_by_pete'
```

5. Go to your application's directory in Terminal and run:

```ruby
bundle install
```

6. Go to the application directory in Terminal and run the following command to install the necessary files from the gem:


```ruby
bundle exec rake 'install_countries_regions_and_cities_by_pete[Place]'
```

7. Add jQuery to your layout file: /app/views/layouts/application.html.erb

```html
<script src='/countries_regions_and_cities_by_pete/jquery-3.6.0.min.js'></script>
```

8. Paste this code to your _form.html.erb file: /app/views/places/_form.html.erb
```ruby

<div class="field" id="country_field">
  <%= render partial: "shared/country_select_by_pete", locals: {model: form.object.class.name, label: "Country", selected: form.object.country} %>
  </div>
<div class="field" id="region_field">
  <%= render partial: "shared/region_select_by_pete", locals: {model: form.object.class.name, label: "Region / State", selected_country: form.object.country, selected: form.object.region} %>
  </div>
 <div class="field" id="city_field">
  <%= render partial: "shared/city_select_by_pete", locals: {model: form.object.class.name, label: "City", selected_region: form.object.region, selected_country: form.object.country, selected: form.object.city} %>
  </div>

```
9. Allow parameters (country,region and city) in your controller: /app/controllers/places_controller.rb

```ruby
def place_params
   params.require(:place).permit(:name, :description, :address, :country, :region, :city)
end
```

Video Tutorial
===============

Watch this video to see how it works

[![IMAGE ALT TEXT HERE](https://ozonegroup.co/countries_regions_and_cities.png)](https://www.youtube.com/watch?v=mSwfFtYE8HE)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterconsuegra/countries_regions_and_cities. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/peterconsuegra/countries_regions_and_cities_by_peterconsuegra/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the CountriesRegionsAndCitiesByPeterconsuegra project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/peterconsuegra/countries_regions_and_cities_by_peterconsuegra/blob/master/CODE_OF_CONDUCT.md).
