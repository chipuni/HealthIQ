require 'csv'

require './lib/bloodsugar.rb'
require './lib/exercise.rb'
require './lib/food.rb'

# The main class for the Health IQ program.
class HealthIQ
  def initialize(filename_food, filename_exercise)
    @bloodsugar = BloodSugar.new

    CSV.foreach(filename_food, converters: :numeric) do |row_food|
      food = Food.lookup(row_food[0], row_food[1])
      @bloodsugar.add_modifier(food)
    end

    CSV.foreach(filename_exercise, converters: :numeric) do |row_exercise|
      exercise = Exercise.lookup(row_exercise[0], row_exercise[1])
      @bloodsugar.add_modifier(exercise)
    end
  end

  def output
    daily_blood_sugar = @bloodsugar.compute(1440)
    daily_blood_sugar.each do |dbs|
      puts dbs
    end
    puts "Glycation = #{@bloodsugar.glycation(1440)}"
  end
end
