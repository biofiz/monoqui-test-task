class BaseCalculationRule
  def initialize(base_price)
    @base_price = base_price
  end

  def amount_per_position(amount)
    @base_price * amount
  end
end
