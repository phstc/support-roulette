# encoding: utf-8

require "rake/testtask"
require "pry"
require "irb"
require "irb/completion"
require "#{Dir.pwd}/config/boot"

task default: :test

Rake::TestTask.new do |t|
  t.pattern = "spec/**/*_spec.rb"
end

namespace :db do
  # http://blog.aizatto.com/2007/05/27/activerecord-migrations-without-rails/
  # http://exposinggotchas.blogspot.com.br/2011/02/activerecord-migrations-without-rails.html
  desc "Migrate the database (options: VERSION=x, VERBOSE=false)."
  task :migrate do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate MIGRATIONS_DIR, ENV["VERSION"] ? ENV["VERSION"].to_i : nil
  end

  desc "Retrieves the current schema version number"
  task :version do
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

task :console do
  ARGV.clear
  IRB.start
end
