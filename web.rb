# encoding: utf-8

require "sinatra"
require "./config/boot.rb"

get "/voice_request" do
  @agent = Agent.current
  builder :support_roulette_call
end

get "/notify_current_agent" do
  Agent.current.notify
end

