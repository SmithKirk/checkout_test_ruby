describe TargetSpendDisc do


  subject(:spend_disc){described_class.new(60,0.1)}

  describe '#initialize' do
    it 'will have target spend set' do
      expect(spend_disc.target_spend).to eq(60)
    end

    it 'will have discount percentage set' do
      expect(spend_disc.discount).to eq(0.1)
    end
  end

  describe '#calculate_disc' do
    it 'will apply discount to total if over target spend' do
      expect(spend_disc.calculate_disc(100)).to eq(10)
    end

    it 'will not apply discount if under target spend' do
      expect(spend_disc.calculate_disc(50)).to eq(0)
    end
  end
end
