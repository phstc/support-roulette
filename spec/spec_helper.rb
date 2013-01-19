require "minitest/spec"
require "minitest/autorun"
require "mocha/setup"
require "./config/boot"


CONFIG.instance_eval do
  def [] key
    @config ||= YAML::load(ERB.new(File.read("./spec/fixtures/application.yml")).result)
    @config[key]
  end
end

