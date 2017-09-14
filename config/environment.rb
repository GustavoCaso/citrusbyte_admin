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

# Set up the models
Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload filename.split('_').map(&:capitalize).join, model_file
end

# Set up the routes, helpers
%w(services helpers routes).each do |folder|
  Dir[APP_ROOT.join('app', folder, '**/*.rb')].each { |file| require file }
end

# Set up the database
require APP_ROOT.join('config', 'database')
