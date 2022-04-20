require 'rails_helper'

RSpec.describe "item_categories/edit", type: :view do
  before(:each) do
    @item_category = assign(:item_category, ItemCategory.create!(
      menu_id: 1,
      category_id: 1
    ))
  end

  it "renders the edit item_category form" do
    render

    assert_select "form[action=?][method=?]", item_category_path(@item_category), "post" do

      assert_select "input[name=?]", "item_category[menu_id]"

      assert_select "input[name=?]", "item_category[category_id]"
    end
  end
end
