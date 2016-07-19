class MultibuyDisc

  attr_reader :code, :quantity, :multibuy_saving

  def initialize(code, quantity, multibuy_saving)
    @code = code
    @quantity = quantity
    @multibuy_saving = multibuy_saving
  end

  def calculate_disc(order)
    if order[@code] >= @quantity
      return order[@code] * multibuy_saving
    else
      return 0
    end
  end

end
