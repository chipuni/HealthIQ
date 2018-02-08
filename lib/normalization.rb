# This class represents the automatic 'normalization' that happens if nothing
# else is affecting blood sugar.
class Normalization
  def delta(blood_sugar, _time)
    if blood_sugar <= 79.0
      1.0
    elsif blood_sugar <= 81.0
      (80.0 - blood_sugar)
    else
      -1.0
    end
  end
end
