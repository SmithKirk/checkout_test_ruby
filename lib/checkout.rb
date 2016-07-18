class Checkout

  attr_reader :basket

  def initialize(item_klass)
    @catalogue = item_klass.catalogue
    @basket = Hash.new(0)
  end

  def scan(item)
    raise "Error: Item not found in catalogue" unless valid_item?(item)
    basket[item] += 1
  end

  private

  attr_reader :catalogue
  def valid_item?(item_code)
    catalogue.map{|item| item.code}.include?(item_code)
  end
end
