# This class represents food eaten or exercise done.
class SimpleModifier
  def initialize(time_start, time_length, glycemic)
    raise 'No time travel, please.' if time_length < 0
    @time_start = time_start
    @time_length = time_length
    @glycemic_per_minute = glycemic.to_f / time_length.to_f
  end

  def delta(_blood_sugar, time)
    if @time_start <= time && time < @time_start + @time_length
      @glycemic_per_minute
    else
      0.0
    end
  end
end
