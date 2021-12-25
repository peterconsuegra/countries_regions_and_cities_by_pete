# frozen_string_literal: true

require "bundler/gem_tasks"
require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: :rubocop

require 'countries_regions_and_cities_by_pete'

spec = Gem::Specification.find_by_name 'my_gem'
rakefile = "#{spec.gem_dir}/lib/tasks/hello_pete.rake"
load rakefile