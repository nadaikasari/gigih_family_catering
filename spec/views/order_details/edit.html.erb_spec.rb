require 'rails_helper'

RSpec.describe "order_details/edit", type: :view do
  before(:each) do
    @order_detail = assign(:order_detail, OrderDetail.create!())
  end

  it "renders the edit order_detail form" do
    render

    assert_select "form[action=?][method=?]", order_detail_path(@order_detail), "post" do
    end
  end
end
