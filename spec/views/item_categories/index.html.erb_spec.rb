require 'rails_helper'

RSpec.describe "item_categories/index", type: :view do
  before(:each) do
    assign(:item_categories, [
      ItemCategory.create!(
        menu_id: 2,
        category_id: 3
      ),
      ItemCategory.create!(
        menu_id: 2,
        category_id: 3
      )
    ])
  end

  it "renders a list of item_categories" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
