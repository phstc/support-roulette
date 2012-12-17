# encoding: utf-8

require "sinatra"
require "#{Dir.pwd}/config/boot.rb"

get "/" do
  @agent = Agent.current_agent
  builder :support_roulette_call
end

