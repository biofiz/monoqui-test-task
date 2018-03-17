class SpecialCalculationRule < BaseCalculationRule

  def initialize(base_price, discount_amount, discount_price)
    super(base_price)
    @discount_amount = discount_amount
    @discount_price  = discount_price
  end

  def amount_per_position(amount)
    special_amount, regular_amount = amount.divmod(@discount_amount)
    @discount_price * special_amount + super(regular_amount)
  end
end
