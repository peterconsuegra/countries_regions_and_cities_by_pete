# Countries Regions And Cities By Peter Consuegra

An agile way to implement Countries, Regions and Cities in your project, without the need to create additional tables

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'countries_regions_and_cities_by_peterconsuegra', '>= 0.2.5'
```

And then execute:

    $ bundle install

Add the jquery.min.js file to the layout you are using: /app/views/layouts/application.html.erb

```javascript
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
```

Run the rake command to generate the necessary files:

    $ bundle exec rake 'install_countries_regions_and_cities_to_model[your_model_name]'

Allow the following trusted parameters: country, region, city in your model controller. Example:

```ruby
# Example: Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :description, :address, :country, :region, :city)
    end
```

Add this code to the _form.html.erb partial of your_model_name form

```

<div class="field" id="country_field">
<%= render partial: 'shared/peterconsuegra_country_select', locals: {model: form.object.class.name.downcase, label: "Country", selected: form.object.country} %>
</div>

<div class="field" id="region_field">
<%= render partial: 'shared/peterconsuegra_region_select', locals: {model: form.object.class.name.downcase, label: "Region / State", selected_country: form.object.country, selected: form.object.region} %>
</div>

<div class="field" id="city_field">
<%= render partial: 'shared/peterconsuegra_city_select', locals: {model: form.object.class.name.downcase, label: "City", selected_region: form.object.region, selected_country: form.object.country, selected: form.object.city} %>
</div>


```

Video Tutorial
===============

Watch this video to see how it works

[![IMAGE ALT TEXT HERE](https://ozonegroup.co/countries_regions_and_cities.png)](https://www.youtube.com/watch?v=VrIVdsOnJsY)




## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/peterconsuegra/countries_regions_and_cities. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/countries_regions_and_cities_by_peterconsuegra/blob/master/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the CountriesRegionsAndCitiesByPeterconsuegra project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/countries_regions_and_cities_by_peterconsuegra/blob/master/CODE_OF_CONDUCT.md).
