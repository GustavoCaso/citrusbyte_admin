# Heroku controls what database we connect to by setting the DATABASE_URL environment variable
# We need to respect that if we want our Sinatra apps to run on Heroku without modification
db_url = ENV['DATABASE_URL'] || "postgres://localhost/#{APP_NAME}_#{Sinatra::Application.environment}"
DB = Sequel.connect(db_url)
DB.extension :pg_json


# Note:
#   Sinatra::Application.environment is set to the value of ENV['RACK_ENV']
#   if ENV['RACK_ENV'] is set.  If ENV['RACK_ENV'] is not set, it defaults
#   to :development
