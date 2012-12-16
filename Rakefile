# http://blog.aizatto.com/2007/05/27/activerecord-migrations-without-rails/
# http://exposinggotchas.blogspot.com.br/2011/02/activerecord-migrations-without-rails.html
require "yaml"
require "logger"
require "active_record"
require "./models/agent.rb"

namespace :db do
  task :environment do
    DATABASE_ENV   = ENV["DATABASE_ENV"]   || "development"
    MIGRATIONS_DIR = ENV["MIGRATIONS_DIR"] || "db/migrate"
  end

  task :configuration => :environment do
    @config = YAML.load_file("config/database.yml")[DATABASE_ENV]
  end

  task :configure_connection => :configuration do
    ActiveRecord::Base.establish_connection @config
    ActiveRecord::Base.logger = Logger.new STDOUT if @config["logger"]
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false)."
  task :migrate => :configure_connection do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate MIGRATIONS_DIR, ENV["VERSION"] ? ENV["VERSION"].to_i : nil
  end

  desc "Retrieves the current schema version number"
  task :version => :configure_connection do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end

namespace :agents do
  task :create_all do
    Agent.create name: "Pablo Cantero", phone: "+5511965056615"
  end

  task :delete_all do
    Agent.delete_all
  end
end

