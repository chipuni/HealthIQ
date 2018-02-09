require './lib/exercise.rb'
require 'test/unit'

# Test the class Exercise
class TestExercise < Test::Unit::TestCase
  def test_lookup
    exercise = Exercise.lookup(0, 'Walking') # Glycemic == 15, over 60 minutes.
    assert_equal(-0.25, exercise.delta(100.0, 30))
    assert_equal(0.0, exercise.delta(100.0, 150))
  end

  def test_unknown_exercise
    assert_raise ArgumentError do
      Exercise.lookup(0, 'Flying')
    end
  end
end
