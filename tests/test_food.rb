require './lib/food.rb'
require 'test/unit'

# Test the class Food
class TestFood < Test::Unit::TestCase
  def test_lookup
    food = Food.lookup(0, 'Wheat tortilla') # Glycemic == 30 over 120 minutes.
    assert_equal(0.25, food.delta(100.0, 30))
    assert_equal(0.0, food.delta(100.0, 150))
  end

  def test_unknown_food
    assert_raise ArgumentError do
      Food.lookup(0, 'Dragon tail with Peashooter sauce')
    end
  end
end
