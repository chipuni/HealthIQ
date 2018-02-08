require './lib/normalization.rb'

# This class represents and computes the blood sugar.
class BloodSugar
  def initialize
    @modifiers = []
    @normalization = Normalization.new
  end

  # Returns an array of blood sugar over time.
  # rubocop:disable Metrics/MethodLength
  def compute(max_time)
    blood_sugar = 80.0
    daily_blood_sugar = []

    (0..max_time).each do |time|
      modified = false

      @modifiers.each do |modifier|
        delta = modifier.delta(blood_sugar, time)
        modified = true if delta != 0.0
        blood_sugar += delta
      end

      blood_sugar += @normalization.delta(blood_sugar, time) unless modified

      daily_blood_sugar << blood_sugar
    end

    daily_blood_sugar
  end
  # rubocop:enable Metrics/MethodLength

  def glycation(max_time)
    count_glycation = 0
    compute(max_time).each do |blood_sugar|
      count_glycation += 1 if blood_sugar > 150.0
    end

    count_glycation
  end

  def add_modifier(modifier)
    @modifiers.push(modifier)
  end
end
