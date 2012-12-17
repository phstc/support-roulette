# encoding: utf-8

require "#{Dir.pwd}/spec/spec_helper"

describe Agent do

  describe "#on_duty?" do
    it "should be on duty" do
      agent = Agent.new support_started_at: Date.today
      assert agent.on_duty?
    end

    it "should not be on duty" do
      agent = Agent.new support_started_at: Date.today + 8.days
      refute agent.on_duty?
    end
  end
end
