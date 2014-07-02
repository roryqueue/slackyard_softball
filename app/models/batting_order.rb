class BattingOrder
  attr_reader :order, :rotation

  def initialize(order)
    @order = order
    @rotation = order
  end

  def next!
    batter = rotation.first
    rotation.rotate!
    batter
  end
end
