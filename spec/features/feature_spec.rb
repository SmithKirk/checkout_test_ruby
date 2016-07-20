describe 'Feature Test' do

  item1 = Item.new('001', 'Travel Card Holder', 9.25)
  item2 = Item.new('002', 'Personalised Cufflinks', 45.00)
  item3 = Item.new('003', 'Kids T-shirt', 19.95)
  catalogue = Item

  promotion = Promotion.new(TargetSpendDisc, MultibuyDisc)
  promotion.set_target_spend_rule(60.00, 0.10)
  promotion.set_multibuy_rule('001', 2, 0.75)

  describe 'basket one' do
    it 'will receive a discount for spending over £60' do
      checkout = Checkout.new(catalogue, promotion)
      checkout.scan('001')
      checkout.scan('002')
      checkout.scan('003')
      expect(checkout.total).to eq("£66.78")
    end
  end

  describe 'basket two' do
    it 'will receive a discount for having 2 travel card holders' do
      checkout = Checkout.new(catalogue, promotion)
      checkout.scan('001')
      checkout.scan('003')
      checkout.scan('001')
      expect(checkout.total).to eq("£36.95")
    end
  end

  describe 'basket three' do
    it 'will receive both discounts' do
      checkout = Checkout.new(catalogue, promotion)
      checkout.scan('001')
      checkout.scan('002')
      checkout.scan('001')
      checkout.scan('003')
      expect(checkout.total).to eq("£73.76")
    end
  end

end
