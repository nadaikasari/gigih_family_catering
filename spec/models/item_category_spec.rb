require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  before :each do
    @menu = create(:menu)
    @category = create(:category)
  end

  it'should belongs_to :menu' do
      expect(ItemCategory.reflect_on_association(:menu).macro).to eq :belongs_to
  end

  it'should belongs_to :categories' do
      expect(ItemCategory.reflect_on_association(:category).macro).to eq :belongs_to
  end

  it 'is valid with a id_category and id_menu' do
    expect(FactoryBot.build(:item_category)).to be_valid
  end

  it 'is invalid without id_category or id_menu or both' do
    item = FactoryBot.build(:invalid_item_category)

    item.valid?

    expect(item.errors[:category_id]).to include("can't be blank")
    expect(item.errors[:menu_id]).to include("can't be blank")
  end

  describe 'self#by_id', :self do
    context 'with matching id' do
      it "should return a sorted array of results that match" do
        @menu = create(:menu)
        menu_id2 = FactoryBot.create(:item_category, menu_id: 2, category_id: 1)
        menu_id3 = FactoryBot.create(:item_category, menu_id: 2, category_id: 1)
  
        expect(ItemCategory.by_id(2)).to eq([menu_id2, menu_id3])
      end
    end
  end  
end
