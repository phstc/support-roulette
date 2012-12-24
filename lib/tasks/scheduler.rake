# encoding: utf-8

require "./config/boot.rb"

desc "This task is called by the Heroku scheduler add-on"

task :notify_current_agent => :environment do
  # Date.today.cweek changes on sundays see Agent.current_agent
  return unless Date.today.sunday?
  puts "Notifying current agent #{Agent.current.name}"
  Agent.current.notify
  puts "done."
end

