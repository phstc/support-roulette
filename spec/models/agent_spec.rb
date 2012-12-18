# encoding: utf-8

require "#{Dir.pwd}/spec/spec_helper"

describe Agent do
  before do
    # TODO create a fixture
    @lord_vader_hash = {"name" => "Lord Vader",
      "phone" => "+5511999999999"}
    @lord_vader = Agent.new @lord_vader_hash
    @homer_simpson_hash = {"name" => "Homer Simpson",
      "phone" => "+5511999999999"}
    @homer_simpson = Agent.new @homer_simpson_hash
    CONFIG.stubs(:[]).with("agents").
      returns([@lord_vader_hash, @homer_simpson_hash])
  end

  describe "#self.current_agent" do
    it "returns the current_agent" do
      Date.stubs today: stub(cweek: 1)
      assert_equal @lord_vader, Agent.current_agent
    end

    it "rotate agents week" do
      Date.stubs today: stub(cweek: 2)
      assert_equal @homer_simpson, Agent.current_agent
    end
  end

  describe "#self.all" do
    it "returns all agents" do
      assert_equal @lord_vader    , Agent.all[0]
      assert_equal @homer_simpson , Agent.all[1]
      assert Agent.all.size == 2
    end
  end

  describe "#==" do
    it "should be equal" do
      assert_equal Agent.new(name: "Zorro", phone: "+5511999999999"), Agent.new(name: "Zorro", phone: "+5511999999999")
    end

    it "should refute different name" do
      assert_equal Agent.new(name: "Zorro", phone: "+5511999999999"), Agent.new(name: "Sancho Panza", phone: "+5511999999999")
    end

    it "should refute different phone" do
      assert_equal Agent.new(name: "Zorro", phone: "+5511999999999"), Agent.new(name: "Zorro", phone: "+5511888888888")
    end
  end
end
