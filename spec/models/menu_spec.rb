require 'rails_helper'

RSpec.describe Menu, type: :model do
  it'should have_many :item_categories' do
    expect(Menu.reflect_on_association(:item_categories).macro).to eq :has_many
  end

  it'should have_many :menus' do
    expect(Menu.reflect_on_association(:menus).macro).to eq :has_many
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

  describe 'self#by_letter' do
    context 'with matching letter' do
      it "should return a sorted array of results that match" do
        menu1 = FactoryBot.create(:menu, name: 'Nasi')
        menu2 = FactoryBot.create(:menu, name: 'Mie')
        menu3 = FactoryBot.create(:menu, name: 'Nasi goreng')
  
        expect(Menu.by_letter("N")).to eq([menu1, menu3])
      end
    end
  end
  
end
