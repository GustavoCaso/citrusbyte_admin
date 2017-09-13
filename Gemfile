source "https://rubygems.org/"

# App Stack
gem 'sinatra'

# Database Stack
gem "sequel"
gem "pg"

gem 'rake'
gem 'pry'

gem 'shotgun'

group :test do
  gem 'database_cleaner', '~> 1.4.1'
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker'
end
