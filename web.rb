require "sinatra"
require "./models/agent.rb"

get "/" do
  @agent = Agent.current_agent
  builder :support_roulette_call
end

