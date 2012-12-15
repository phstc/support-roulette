require "sinatra"
require "builder"
require "./models/power_ranger.rb"

get "/" do
  "Hello World!"
  @ranger = PowerRanger.current_ranger
  builder :support_roulette_call
end

