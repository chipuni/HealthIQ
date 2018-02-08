require './lib/normalization.rb'
require 'test/unit'

# Test the class Normalization
class TestNormalization < Test::Unit::TestCase
  def test_normalization
    normalization = Normalization.new

    assert_equal(1.0, normalization.delta(50.0, 100))
    assert_equal(0.5, normalization.delta(79.5, 100))
    assert_equal(0.0, normalization.delta(80.0, 100))
    assert_equal(-0.5, normalization.delta(80.5, 100))
    assert_equal(-1.0, normalization.delta(120.0, 100))
  end
end
