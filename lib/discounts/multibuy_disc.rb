class MultibuyDisc

  attr_reader :code, :quantity, :multibuy_price

  def initialize(code, quantity, multibuy_price)
    @code = code
    @quantity = quantity
    @multibuy_price = multibuy_price
  end
end
