describe Checkout do

  subject(:checkout){described_class.new(item_klass)}
  let(:item_klass) {double catalogue: [item1, item2]}
  let(:item1){double(code: '001', name: 'Lavender heart', price: 9.25)}
  let(:item2){double(code: '002', name: 'Personalised cufflinks', price: 45.00)}


  describe '#scan' do
    it 'will add item to basket' do
      checkout.scan('001')
      expect(checkout.basket).to eq({'001' => 1})
    end

    it 'will raise an error if item is not found' do
      expect{checkout.scan('010')}.to raise_error("Error: Item not found in catalogue")
    end
  end
end
