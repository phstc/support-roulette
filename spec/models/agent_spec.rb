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

  describe "#self.current_agent" do
    it "should return the current agent" do
      current_agent = Agent.new name: "Pablo Cantero",
        phone: "+5511999999999"
      Agent.stubs(:order).returns([current_agent])
      assert_same current_agent, Agent.current_agent
    end

    describe "agent rotation" do
      before do
        @current_agent = Agent.new name: "Pablo Cantero",
          phone: "+5511999999999",
          support_started_at: Date.today + 8
        @next_agent = Agent.new name: "Pablo Cantero",
          phone: "+5511888888888",
          support_started_at: Date.today - 8

        Agent.stubs(:order).returns([@current_agent])

        next_agent_query = stub(order: [@next_agent])
        Agent.stubs(:where).with("id != ?", nil).returns(next_agent_query)

        Agent.any_instance.stubs(:update_attribute)
      end

      it "rotates and return current agent" do
        assert_same @next_agent, Agent.current_agent
      end

      it "updates next agent start date" do
        @next_agent.expects(:update_attribute).with(:support_started_at, Date.today)
        Agent.current_agent
      end
    end
  end
end
