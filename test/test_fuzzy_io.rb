require 'minitest/autorun'

require 'fuzzy_io'
require 'fuzzy_io/version'

API_KEY = ENV["FUZZY_IO_API_KEY"]
AGENT_ID = ENV["FUZZY_IO_AGENT_ID"]

class TestFuzzyIo < MiniTest::Unit::TestCase

  def setup
    @account = FuzzyIo::Account.new API_KEY
  end

  def test_api_key_property
    assert_equal @account.key, API_KEY
  end

  def test_has_evaluate_method
    inputs = {input1: 10}
    outputs = @account.evaluate AGENT_ID, inputs
    assert_in_delta outputs["output1"], 8.8, 0.1
  end

end
