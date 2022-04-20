require 'rails_helper'

RSpec.describe "order_details/new", type: :view do
  before(:each) do
    assign(:order_detail, OrderDetail.new())
  end

  it "renders new order_detail form" do
    render

    assert_select "form[action=?][method=?]", order_details_path, "post" do
    end
  end
end
