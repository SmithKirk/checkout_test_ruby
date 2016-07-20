describe Checkout do

  subject(:checkout){described_class.new(item_klass, promotion_klass)}
  let(:item_klass) {double catalogue: [item1, item2]}
  let(:promotion_klass) {double apply_discounts: 0}
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

    it 'will add multiples of the same item' do
      checkout.scan('001')
      checkout.scan('002')
      checkout.scan('001')
      expect(checkout.basket).to eq({'001' => 2, '002' => 1})
    end
  end

  describe '#total' do
    it 'will return a total price for basket' do
      checkout.scan('001')
      checkout.scan('002')
      expect(checkout.total).to eq('£54.25')
    end
  end
end
