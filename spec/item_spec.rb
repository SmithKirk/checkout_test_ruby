describe Item do

  subject(:item1){described_class.new('001','Lavender heart', 9.25)}

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
