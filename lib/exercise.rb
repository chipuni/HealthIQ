require 'csv'

require './lib/simple_modifier.rb'

# Exercise decreases blood sugar linearly for one hour.
class Exercise
  @database = {}

  class << self
    attr_accessor :database

    # Load the map of exercise names to glycemic index.
    CSV.foreach('./data/exercise.csv', converters: :numeric) do |food|
      Exercise.database[food[1]] = food[2]
    end
  end

  def self.lookup(time_start, name)
    if Exercise.database.key?(name)
      return Exercise.new(time_start,
                          Exercise.database[name])
    end

    raise ArgumentError, 'No such exercise found!'
  end

  def initialize(time_start, glycemic)
    @modifier = SimpleModifier.new(time_start, 60, -glycemic)
  end

  def delta(blood_sugar, time)
    @modifier.delta(blood_sugar, time)
  end
end
