require 'minitest/autorun'

require 'fuzzy_io'
require 'fuzzy_io/version'

API_KEY = "AAAABBBBB"
AGENT_ID = "CCCCDDDD"

class TestFuzzyIo < MiniTest::Unit::TestCase

  def setup
    @account = FuzzyIo::Account.new API_KEY
  end

  def test_api_key_property
    assert_equal @account.key, API_KEY
  end

  def test_evaluate
    assert_equal "0.0.1", FuzzyIo::VERSION
  end

end
