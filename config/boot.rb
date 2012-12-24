require "yaml"
require "logger"
require "date"
require "#{Dir.pwd}/models/agent"

CONFIG ||= YAML::load(ERB.new(File.read("#{Dir.pwd}/config/application.yml")).result)

