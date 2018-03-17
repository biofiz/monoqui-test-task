class BaseCalculationRule
  def initialize(base_price)
    @base_price = base_price
  end

  def cost(amount)
    @base_price * amount
  end
end
