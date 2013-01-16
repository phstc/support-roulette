# encoding: utf-8

require "./config/boot"

class Agent
  attr_accessor :name, :phone

  def initialize attributes
    @name  = attributes["name"]
    @phone = attributes["phone"]
  end

  def self.current
    all[(Date.today.cweek % all.size) - 1]
  end

  def self.all
    @all ||= CONFIG["agents"].map {|agent_hash| Agent.new agent_hash}
  end

  def notify
    TwilioClient.send_message @phone,
      CONFIG["twilio"]["from_sms"],
      "Congratulations, you are the current support agent!"
  end
end

