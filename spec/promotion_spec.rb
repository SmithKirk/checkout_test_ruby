describe Promotion do

  subject(:promo){described_class.new(target_spend_disc_klass, multibuy_disc_klass)}
  let(:target_spend_disc_klass){double new: disc_at_60}
  let(:disc_at_60){double calculate_disc: 0}
  let(:multibuy_disc_klass){double new: multibuy_disc_001}
  let(:multibuy_disc_001){double calculate_disc: 0}
  let(:order) {{"001"=> 2, "002"=>1, '003'=>1}}

  context 'before discount rules are set' do
    describe '#set_target_spend_rule' do
      it 'will set the conditions of the promotion' do
        promo.set_target_spend_rule(60, 10)
        expect(promo.target_spend_rule).to eq(disc_at_60)
      end
    end

    describe '#set_multibuy_rule' do
      it 'will set the conditions of the promotion' do
        promo.set_multibuy_rule('001', 2, 0.75)
        expect(promo.multibuy_rule).to eq([multibuy_disc_001])
      end
    end
  end

  context 'after discount rules are set' do
    before do
          promo.set_target_spend_rule(60, 10)
          promo.set_multibuy_rule('001', 2, 0.75)
        end

    describe '#apply_discounts' do
      it 'will apply target spend discount to total' do
        allow(promo.target_spend_rule).to receive(:calculate_disc).and_return(10)
        expect(promo.apply_discounts(100, order)).to eq(10)
      end

      it 'will apply multibuy discount to total' do
        allow(promo.multibuy_rule.first).to receive(:calculate_disc).and_return(1.50)
        allow(promo.target_spend_rule).to receive(:calculate_disc).and_return(0)
        expect(promo.apply_discounts(100, order)).to eq(1.50)
      end

      it 'will apply both discounts to total' do
        allow(promo.target_spend_rule).to receive(:calculate_disc).and_return(10)
        allow(promo.multibuy_rule.first).to receive(:calculate_disc).and_return(1.50)
        expect(promo.apply_discounts(100, order)).to eq(11.50)
      end
    end
  end


end
