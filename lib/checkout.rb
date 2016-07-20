require 'bigdecimal'
class Checkout

  attr_reader :basket

  def initialize(item_klass, promotion_klass)
    @catalogue = item_klass.catalogue
    @promotions = promotion_klass
    @basket = Hash.new(0)
  end

  def scan(item)
    raise "Error: Item not found in catalogue" unless valid_item?(item)
    basket[item] += 1
  end

  def total
    "£#{(basket_total - discount).round(2)}"
  end

  private

  attr_reader :catalogue

  def valid_item?(item_code)
    catalogue.map{|item| item.code}.include?(item_code)
  end

  def basket_total
    basket.reduce(0) do |total, (item, quantity)|
      total += price_list[item] * quantity
    end
  end

  def price_list
    price_list = catalogue.map do |item|
      [item.code, item.price]
    end
    price_list.to_h
  end

  def discount
    @promotions.apply_discounts(basket_total, basket)
  end
end
