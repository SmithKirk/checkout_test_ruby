describe TargetSpendDisc do


  subject(:promotion){described_class.new(60,0.1)}

  describe '#initialize' do
    it 'will have target spend set' do
      expect(promotion.target_spend).to eq(60)
    end
  end
end
