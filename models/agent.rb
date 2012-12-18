# encoding: utf-8

require "#{Dir.pwd}/config/boot"

class Agent
  attr_accessor :name, :phone

  def initialize attributes
    @name  = attributes["name"]
    @phone = attributes["phone"]
  end

  def self.current_agent
    all[(Date.today.cweek % all.size) - 1]
  end

  def self.all
    @all ||= CONFIG["agents"].map { | agent_hash | Agent.new agent_hash }
  end
end

