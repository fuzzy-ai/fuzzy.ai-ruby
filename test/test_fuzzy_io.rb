require 'minitest/autorun'

require 'fuzzy_io/version'

API_KEY = "AAAABBBBB"
AGENT_ID = "CCCCDDDD"

class TestFuzzyIo < MiniTest::Unit::TestCase

  def test_evaluate
    assert_equal "0.0.1", FuzzyIo::VERSION
  end

end
