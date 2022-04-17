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

  it 'is invalid without a name and price', :invalidnameprice do
    menu = FactoryBot.build(:menu, name: nil, price: nil)

    menu.valid?

    expect(menu.errors[:name]).to include("can't be blank")
    expect(menu.errors[:price]).to include("can't be blank")
  end

  
end
