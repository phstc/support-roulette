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

namespace :scheduler do
  task :notify_current_agent do
    # Date.today.cweek changes on sundays see Agent.current_agent
    if Date.today.sunday?
      puts "Notifying current agent #{Agent.current.name}"
      Agent.current.notify
      puts "done."
    end
  end
end

task :console do
  ARGV.clear
  IRB.start
end
