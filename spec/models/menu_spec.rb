require 'rails_helper'

RSpec.describe Menu, type: :model do
  it'should have_many :item_categories' do
      expect(Menu.reflect_on_association(:item_categories).macro).to eq :has_many
  end

  it'should have_many :order_details' do
      expect(Menu.reflect_on_association(:order_details).macro).to eq :has_many
  end

  it 'is valid with a name, description and price' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'is invalid without a name and price' do
    menu = FactoryBot.build(:menu, name: nil, price: nil)

    menu.valid?

    expect(menu.errors[:name]).to include("can't be blank")
    expect(menu.errors[:price]).to include("can't be blank")
  end

  it 'is invalid with a duplicated name' do
    menu = FactoryBot.create(:menu, name: "Nasi")
    menu = FactoryBot.build(:menu, name: "Nasi")

    menu.valid?

    expect(menu.errors[:name]).to include("has already been taken")
  end

  it 'is invalid price less than 0.01' do
    menu = FactoryBot.build(:menu, price: 0.004)
    
    menu.valid?
    expect(menu.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  
end
