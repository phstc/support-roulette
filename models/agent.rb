# encoding: utf-8

require "#{Dir.pwd}/config/boot"
require "twilio-ruby"

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
    @all ||= CONFIG["agents"].map {|agent_hash| Agent.new agent_hash}
  end

  def notify
    message = client.account.sms.messages.create to: @phone,
      from: CONFIG["twilio"]["from_sms"],
      body: "Congratulations you are the current support agent!"
  end

  private
  def client
    @client ||= Twilio::REST::Client.new CONFIG["twilio"]["account_sid"], CONFIG["twilio"]["auth_token"]
  end
end

