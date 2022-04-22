require 'rails_helper'

RSpec.describe Menu, type: :model do
  it'should have_many :categories' do
    expect(Menu.reflect_on_association(:categories).macro).to eq :has_many
  end

  it'should have_many :order_details' do
    expect(Menu.reflect_on_association(:order_details).macro).to eq :has_many
  end

  it 'is valid with a name, description and price' do
    expect(FactoryBot.build(:menu)).to be_valid
  end

  it 'is invalid without a name, price and category' do
    menu = FactoryBot.build(:menu, name: nil, price: nil, category: nil)

    menu.valid?

    expect(menu.errors[:name]).to include("can't be blank")
    expect(menu.errors[:price]).to include("can't be blank")
    expect(menu.errors[:category]).to include("can't be blank")
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

  it 'is invalid description exceed 150 characters' do
    menu = FactoryBot.build(:menu, description: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
    
    menu.valid?
    expect(menu.errors[:description]).to include("is too long (maximum is 150 characters)")
  end

  it 'is invalid price accept non numeric values' do
    menu = FactoryBot.build(:menu, price: "Seribu")
    menu.valid?
    expect(menu.errors[:price]).to include("is not a number")
  end

  describe 'self#by_id' do
    context 'with matching id' do
      it "should return a array of results that match" do
        menu1 = FactoryBot.create(:menu, id: 1, name: "Sayur")
        menu2 = FactoryBot.create(:menu, id: 2, name: "Nasi")
  
        expect(Menu.by_id(1)).to eq([menu1])
      end
    end
  end
end
