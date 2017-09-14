# Require gems we care about
require 'rubygems'
require "bundler/setup"

require 'uri'
require 'pathname'

require 'pg'
require 'sequel'
require 'logger'

require 'sinatra'
require 'erb'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do
  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Automatically load every file in APP_ROOT/app/models/*.rb, e.g.,
#   autoload "Person", 'app/models/person.rb'
#
# We have to do this in case we have models that inherit from each other.
# If model Student inherits from model Person and app/models/student.rb is
# required first, it will throw an error saying "Person" is undefined.
#
# With this lazy-loading technique, Ruby will try to load app/models/person.rb
# the first time it sees "Person" and will only throw an exception if
# that file doesn't define the Person class.
#
# See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload filename.split('_').map(&:capitalize).join, model_file
end

# Set up the routes and helpers
Dir[APP_ROOT.join('app', 'routes', '**/*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '**/*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')
