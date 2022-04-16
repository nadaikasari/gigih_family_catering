require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with a name' do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it 'is invalid without a name' do
    category = FactoryBot.build(:category, name: nil)

    category.valid?

    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicated name' do
    category = FactoryBot.create(:category, name: "Beverage")
    category = FactoryBot.build(:category, name: "Beverage")

    category.valid?

    expect(category.errors[:name]).to include("has already been taken")
  end

  describe 'self#by_letter', :self_byletter do
    context 'with matching letter' do
      it "should return a sorted array of results that match" do
        category1 = FactoryBot.create(:category, name: 'Beverage')
        category2 = FactoryBot.create(:category, name: 'Dessert')
        category3 = FactoryBot.create(:category, name: 'Drink')
  
        expect(Category.by_letter("D")).to eq([category2, category3])
      end
    end
  end
  
end
