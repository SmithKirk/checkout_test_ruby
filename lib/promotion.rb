class Promotion

  attr_reader :target_spend_rule, :multibuy_rule

  def initialize(target_spend_disc_klass, multibuy_disc_klass)
    @target_spend_disc = target_spend_disc_klass
    @multibuy_disc = multibuy_disc_klass
    @target_spend_rule = nil
    @multibuy_rule = []
  end


  def set_target_spend_rule(target_spend, disc )
    @target_spend_rule = @target_spend_disc.new(target_spend, disc)
  end

  def set_multibuy_rule(code, quantity, multibuy_saving)
    @multibuy_rule << @multibuy_disc.new(code, quantity, multibuy_saving)
  end

  def apply_discounts(total, order)
    apply_multibuy(order) +
    @target_spend_rule.calculate_disc(total - apply_multibuy(order))
  end

  private
  
  def apply_multibuy(order)
    @multibuy_rule.reduce(0) do |saving, rule|
      saving + rule.calculate_disc(order)
    end
  end
end
