describe MultibuyDisc do

  subject(:promo){described_class.new('001', 2, 8.50)}

  describe '#initialize' do
    it 'will set item code for discount' do
      expect(promo.code).to eq('001')
    end

    it 'will set quantity condition for discount' do
      expect(promo.quantity).to eq(2)
    end

    it 'will set multibuy price' do
      expect(promo.multibuy_price).to eq(8.50)
    end
  end
end
