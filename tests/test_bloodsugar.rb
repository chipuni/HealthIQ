require './lib/bloodsugar.rb'
require './lib/simple_modifier.rb'
require 'test/unit'

# Test the class BloodSugar
class TestBloodSugar < Test::Unit::TestCase
  def test_bloodsugar_no_modifier
    bs = BloodSugar.new # Notice no modifiers.

    # An arbitrary date-time will always be 80.
    daily_blood_sugar = bs.compute(100)
    daily_blood_sugar.each do |dbs|
      assert_equal(80.0, dbs)
    end

    # With no modifier, there is no glycation.
    assert_equal(0, bs.glycation(100))
  end

  def test_bloodsugar_food
    bs = BloodSugar.new
    food = SimpleModifier.new(0, 8, 80.0)
    bs.add_modifier(food)

    daily_blood_sugar = bs.compute(9)
    assert_equal([90.0, 100.0, 110.0, 120.0, 130.0, 140.0, 150.0, 160.0,
                  159.0, 158.0],
                 daily_blood_sugar)
    assert_equal(3, bs.glycation(9))
  end
end
