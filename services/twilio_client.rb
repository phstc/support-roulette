# encoding: utf-8

require "./config/boot"
require "twilio-ruby"

class TwilioClient
  def self.send_message to, from, body
    client.account.sms.messages.create to: to, from: from, body: body
  end

  def self.client
    @client ||= Twilio::REST::Client.new CONFIG["twilio"]["account_sid"], CONFIG["twilio"]["auth_token"]
  end
end
