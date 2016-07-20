describe MultibuyDisc do

  subject(:multibuy_disc){described_class.new('001', 2, 0.75)}
  let(:order1){{'001' => 2}}
  let(:order2){{'001' => 1}}
  let(:order3){{'001' => 1, '002' => 2}}

  describe '#initialize' do
    it 'will set item code for discount' do
      expect(multibuy_disc.code).to eq('001')
    end

    it 'will set quantity condition for discount' do
      expect(multibuy_disc.quantity).to eq(2)
    end

    it 'will set multibuy price' do
      expect(multibuy_disc.multibuy_saving).to eq(0.75)
    end
  end

  describe '#calculate_disc' do
    it 'will apply discount if 2 or more 001 are in order' do
      expect(multibuy_disc.calculate_disc(order1)).to eq(1.50)
    end

    it 'will not apply discount if 1 of 001 are in order' do
      expect(multibuy_disc.calculate_disc(order2)).to eq(0)
    end

    it 'will not apply discount if 2 or more 002 are in order' do
      expect(multibuy_disc.calculate_disc(order3)).to eq(0)
    end
  end
end
