# encoding: utf-8

require "#{Dir.pwd}/config/boot"

class Agent < ActiveRecord::Base
  def self.current_agent
    agent = order("support_started_at DESC").first
    agent = rotate_agent!(agent) unless agent.on_duty?
    agent
  end

  def on_duty?
    (support_started_at - Date.today).to_i <= 7
  end

  private
  def self.next_agent agent
    where("id != ?", agent.id).order("support_started_at ASC").first
  end

  def self.rotate_agent! agent
    new_agent = next_agent(agent)
    new_agent.update_attribute :support_started_at, Date.today
    new_agent
  end
end
