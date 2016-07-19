class TargetSpendDisc

  attr_reader :target_spend, :discount

  def initialize(target_spend, discount)
    @target_spend = target_spend
    @discount = discount
  end

  def calculate_disc(total)
    if total > @target_spend
      return total * @discount
    else
      return 0
    end
  end
  
end
