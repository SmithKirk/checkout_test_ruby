describe Item do

  let(:item1){described_class.new('001', 'Lavender heart', 9.25)}
  let(:item2){ described_class.new('002', 'Personalised cufflinks', 45.00)}



  describe 'catalogue' do
    it 'holds all Item instances inside @@catalogue' do
      expect(Item.catalogue).to eq([item1,item2])
    end
  end

  describe '#initialize' do
    it 'sets item code correctly' do
      expect(item1.code).to eq('001')
    end

    it 'sets item name correctly' do
      expect(item1.name).to eq('Lavender heart')
    end

    it 'sets item price correctly' do
      expect(item1.price).to eq(9.25)
    end

  end



end
