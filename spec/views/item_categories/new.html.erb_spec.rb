require 'rails_helper'

RSpec.describe "item_categories/new", type: :view do
  before(:each) do
    assign(:item_category, ItemCategory.new(
      menu_id: 1,
      category_id: 1
    ))
  end

  it "renders new item_category form" do
    render

    assert_select "form[action=?][method=?]", item_categories_path, "post" do

      assert_select "input[name=?]", "item_category[menu_id]"

      assert_select "input[name=?]", "item_category[category_id]"
    end
  end
end
