require './lib/health_iq.rb'
require 'test/unit'

# Testing for the HealthIQ class.
class TestHealthIQ < Test::Unit::TestCase
  def test_sample
    assert_equal(4, 2 + 2)
  end
end
