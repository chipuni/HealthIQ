require './lib/simple_modifier.rb'

# Exercise decreases blood sugar linearly for one hour.
class Exercise
  def initialize(time_start, glycemic)
    @modifier = SimpleModifier.new(time_start, 60, -glycemic)
  end

  def delta(blood_sugar, time)
    @modifier.delta(blood_sugar, time)
  end
end
