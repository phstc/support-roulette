require "yaml"
require "logger"
require "date"
require "#{Dir.pwd}/models/agent"


CONFIG ||= YAML::load(File.open("#{Dir.pwd}/config/application.yml"))

