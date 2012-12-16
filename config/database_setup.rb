DATABASE_ENV   = ENV["DATABASE_ENV"]   || "development"
MIGRATIONS_DIR = ENV["MIGRATIONS_DIR"] || "db/migrate"

@config = YAML.load_file("config/database.yml")[DATABASE_ENV]

ActiveRecord::Base.establish_connection @config
ActiveRecord::Base.logger = Logger.new STDOUT if @config["logger"]

ActiveRecord::Migration.verbose = true
ActiveRecord::Migrator.migrate MIGRATIONS_DIR, ENV["VERSION"] ? ENV["VERSION"].to_i : nil
