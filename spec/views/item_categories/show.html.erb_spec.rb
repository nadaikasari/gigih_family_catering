require 'rails_helper'

RSpec.describe "item_categories/show", type: :view do
  before(:each) do
    @item_category = assign(:item_category, ItemCategory.create!(
      menu_id: 2,
      category_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
