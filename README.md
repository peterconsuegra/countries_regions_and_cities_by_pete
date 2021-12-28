# Countries, Regions and Cities by Pete

An agile way to implement Countries, Regions, and Cities in a scaffold of your Ruby On Rails project, without the need to create additional tables 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'countries_regions_and_cities_by_pete'
```

And then execute:

    $ bundle install

Run the rake command to generate the necessary files:

```shell
bundle exec rake 'install_countries_regions_and_cities_by_pete[ModelName]'
```

Add the jquery.min.js file to the layout you are using: /app/views/layouts/application.html.erb

```html
<script src='/countries_regions_and_cities_by_pete/jquery-3.6.0.min.js'></script>
```

Add these code to the _form.html.erb 
```html

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

Allow the following trusted parameters: country, region, city in your model controller. Example:

```ruby
# Example: Only allow a list of trusted parameters through.
def hotel_params
   params.require(:hotel).permit(:name, :description, :address, :country, :region, :city)
end
```

Video Tutorial
===============

Watch this video to see how it works

[![IMAGE ALT TEXT HERE](https://ozonegroup.co/countries_regions_and_cities.png)](https://www.youtube.com/watch?v=mSwfFtYE8HE)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterconsuegra/countries_regions_and_cities. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/countries_regions_and_cities_by_peterconsuegra/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the CountriesRegionsAndCitiesByPeterconsuegra project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/countries_regions_and_cities_by_peterconsuegra/blob/master/CODE_OF_CONDUCT.md).
