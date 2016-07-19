class MultibuyDisc

  attr_reader :code, :quantity, :multibuy_saving

  def initialize(code, quantity, multibuy_saving)
    @code = code
    @quantity = quantity
    @multibuy_saving = multibuy_saving
  end

  def calculate_disc(order)
    return saving(order) if order[@code] >= @quantity
    return 0
  end

  private
  
  def saving(order)
    order[@code] * multibuy_saving
  end

end
