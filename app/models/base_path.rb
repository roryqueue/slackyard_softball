require 'pry'

class BasePath
  attr_accessor :run_count, :man_on_first, :man_on_second, :man_on_third

  def initialize
    @man_on_first = nil
    @man_on_second = nil
    @man_on_third = nil
    @run_count = 0
  end

end
