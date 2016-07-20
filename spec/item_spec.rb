describe Item do

  before do
    load 'item.rb'
  end

  let(:item1){described_class.new('001', 'Lavender heart', 9.25)}
  let(:item2){ described_class.new('002', 'Personalised cufflinks', 45.00)}
  let(:item3){ described_class.new('003', 'Kids T-shirt', 19.95)}

  describe 'catalogue' do
    it 'will hold all Item instances inside @@catalogue' do
      expect(Item.catalogue).to eq([item1, item2, item3])
    end
  end

  describe '#initialize' do
    it 'will set item code correctly' do
      expect(item1.code).to eq('001')
    end

    it 'will set item name correctly' do
      expect(item1.name).to eq('Lavender heart')
    end

    it 'will set item price correctly' do
      expect(item1.price).to eq(9.25)
    end

  end



end
