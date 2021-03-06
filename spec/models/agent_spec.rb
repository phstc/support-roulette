# encoding: utf-8

require "./spec/spec_helper"

describe Agent do
  describe "#notify" do
    it "should notify current agent" do
      Date.stubs today: stub(cweek: 1)
      TwilioClient.expects(:send_message).
        with("+5511111111111",
             "+5511444444444",
             "Congratulations, you are the current support agent!")
      Agent.current.notify
    end
  end

  describe "#self.current" do
    it "returns the current agent" do
      Date.stubs today: stub(cweek: 1)
      assert_equal "Batman", Agent.current.name
    end

    it "rotate agents weekly" do
      Date.stubs today: stub(cweek: 2)
      assert_equal "Homer", Agent.current.name
    end
  end

  describe "#self.all" do
    it "returns all agents" do
      assert_equal "Batman" , Agent.all[0].name
      assert_equal "Homer"  , Agent.all[1].name
      assert Agent.all.size == 2
    end

    describe "agents is null" do
      it "raises an exception" do
        CONFIG.stubs(:[]).with("agents").returns nil
        proc {Agent.all}.must_raise Exception
      end
    end

    describe "agents is empty" do
      it "raises an exception" do
        CONFIG.stubs(:[]).with("agents").returns []
        proc {Agent.all}.must_raise Exception
      end
    end
  end
end
