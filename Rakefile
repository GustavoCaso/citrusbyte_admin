require ::File.expand_path('../config/environment', __FILE__)
require 'rake'

namespace :db do
  desc "Run all migrations in db/migrate"
  task :migrate do
    Sequel.extension(:migration)
    Sequel::Migrator.apply(DB, "db/migrate")
  end

  desc "Populate the database with dummy data by running db/seeds.rb"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end

  namespace :test do
    desc "Migrate test database"
    task :prepare do
      system "rake db:migrate RACK_ENV=test"
    end
  end
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/environment"
end

task :default  => :spec
