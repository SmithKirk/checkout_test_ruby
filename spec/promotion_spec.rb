describe Promotion do

  subject(:promo){described_class.new(target_spend_disc_klass)}
  let(:target_spend_disc_klass){double new: disc_at_60}
  let(:disc_at_60){double calculate_disc: 0}
  let(:order) {{"001"=> 2, "002"=>1, '003'=>1}}

  describe '#set_target_spend_rule' do
    it 'will set the conditions of the promotion' do
      promo.set_target_spend_rule(60, 10)
      expect(promo.target_spend_rule).to eq(disc_at_60)
    end
  end


  describe '#apply_discounts' do
    it 'will apply target spend discount to total' do
      allow(promo.target_spend_rule).to receive(:calculate_disc).and_return(10)
      expect(promo.apply_discounts(100)).to eq(10)
    end
  end

end
