class TargetSpendDisc

  attr_reader :target_spend, :discount

  def initialize(target_spend, discount)
    @target_spend = target_spend
    @discount = discount
  end

  def calculate_disc(total)
    return saving(total) if total > @target_spend
    return 0
  end

  private

  def saving(total)
    total * @discount
  end

end
