module Maths
  def log_five(a_factor, b_factor)
    win_percentage_A = a_factor.to_i / 100.0
    win_percentage_B = b_factor.to_i / 100.0
    (win_percentage_A - win_percentage_A * win_percentage_B)/
    (win_percentage_A + win_percentage_B - 2.0 * win_percentage_A * win_percentage_B)
  end
end
