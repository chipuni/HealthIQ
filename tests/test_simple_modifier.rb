require './lib/simple_modifier.rb'
require 'test/unit'

# Test the class Food.
class TestSimpleModifier < Test::Unit::TestCase
  # Happy case
  def test_simple_modifier
    food = SimpleModifier.new(20, 10, 10.0)

    assert_equal(0.0, food.delta(80.0, 10))
    assert_equal(1.0, food.delta(80.0, 25))
    assert_equal(0.0, food.delta(80.0, 40))
  end
end
