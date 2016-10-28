# test/fuzzy.ai_test.rb
require './test/test_helper'

API_KEY = 'test-api-key'
AGENT_ID = 'test-agent-id'

class TestFuzzyAi < MiniTest::Unit::TestCase
  def setup
    @account = FuzzyAi::Account.new API_KEY
  end

  def test_api_key_property
    assert_equal @account.key, API_KEY
  end

  def test_has_evaluate_method
    VCR.use_cassette('evaluate') do
      inputs = { input1: 10 }
      outputs, evaluation_id = @account.evaluate AGENT_ID, inputs
      refute_nil evaluation_id
      assert_in_delta outputs['output1'], 8.8, 0.1
    end
  end

  def test_feedback_method
    VCR.use_cassette('feedback') do
      inputs = { input1: 10 }
      _outputs, evaluation_id = @account.evaluate AGENT_ID, inputs
      feedback = { performance: 3 }
      fb = @account.feedback evaluation_id, feedback
      refute_nil fb
    end
  end
end
