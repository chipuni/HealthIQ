require './lib/simple_modifier.rb'

# In our model, eating food will increase blood sugar linearly
# for two hours.  The rate of increase depends on the food as
# defined in a database that we will provide.  See the glycemic
# index column. So if a food had a glycemic index of 50, and you
# eat at time 0, when blood sugar is 80. At T=1 hour blood sugar
# will be 105 and at T=2 hours, blood sugar will be 130.
# (NOTE this is only loosely based on science)
class Food
  def initialize(time_start, glycemic)
    @modifier = SimpleModifier.new(time_start, 120, glycemic)
  end

  def delta(blood_sugar, time)
    @modifier.delta(blood_sugar, time)
  end
end
