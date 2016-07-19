describe Promotion do

  subject(:promo){described_class.new(target_spend_disc_klass)}
  let(:target_spend_disc_klass){double new: disc_at_60}
  let(:disc_at_60){double calculate_disc 0}

  describe '#set_reward_discount' do
    xit 'will set the conditions of the promotion' do
      promo.set_target_spend_rule(60, 10)
      expect(promo.target_spend_rule).to eq(disc_at_60)
    end
  end

end
