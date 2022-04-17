require 'rails_helper'

RSpec.describe Menu, type: :model do
  it'should have_many :item_categories' do
      expect(Menu.reflect_on_association(:item_categories).macro).to eq :has_many
  end

  it'should have_many :order_details' do
      expect(Menu.reflect_on_association(:order_details).macro).to eq :has_many
  end

  it 'is valid with a name, description and price', :isvalid do
    expect(FactoryBot.build(:menu)).to be_valid
  end
end
