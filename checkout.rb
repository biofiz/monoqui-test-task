require_relative 'base_calculation_rule'
require_relative 'special_calculation_rule'

class Checkout

  def initialize(rules)
    @rules    = rules
    @products = {}
  end

  def scan(item)
    item_key = item.strip.upcase.to_sym
    return @products[item_key] +=1 if @products.key?(item_key)
    @products[item_key] = 1
  end

  def total
    @products.inject(0) do |total, (product_name, product_quantity)|
      total + get_position_amount(product_name, product_quantity)
    end
  end

  private
    def get_position_amount(product_name, product_quantity)
      return 0 if product_name.empty?
      return @rules[product_name].amount_per_position(product_quantity) if @rules[product_name]
      raise "The product: #{product_name} was not found in the price list"
    end
end
