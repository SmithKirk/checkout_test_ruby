class Promotion

  attr_reader :target_spend_rule

  def initialize(target_spend_disc_klass)
    @target_spend_disc = target_spend_disc_klass
    @target_spend_rule = nil
  end


  def set_target_spend_rule(target_spend, disc )
    @target_spend_rule = @target_spend_disc.new(target_spend, disc)
  end

  def apply_discounts(total)
    @target_spend_rule.calculate_disc(total)
  end
end
