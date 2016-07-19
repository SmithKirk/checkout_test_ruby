class Promotion

  def initialize(target_spend_disc_klass)
    @target_spend_disc = target_spend_disc_klass

  end


  def set_target_spend_rule(target_spend, disc )
    @target_spend_rule = @target_spend_disc.new(target_spend, disc)
  end
end
