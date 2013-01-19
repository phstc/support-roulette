require "yaml"
require "logger"
require "date"
require "erb"
require "./services/twilio_client"
require "./models/agent"

CONFIG ||= YAML::load ERB.new(File.read("./config/application.yml")).result

