# encoding: utf-8

require "sinatra"
require "#{Dir.pwd}/config/boot.rb"

get "/voice_request" do
  @agent = Agent.current_agent
  builder :support_roulette_call
end

get "/notify_current_agent" do
  Agent.current_agent.notify
end

