require 'rails_helper'

RSpec.describe "order_details/show", type: :view do
  before(:each) do
    @order_detail = assign(:order_detail, OrderDetail.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
