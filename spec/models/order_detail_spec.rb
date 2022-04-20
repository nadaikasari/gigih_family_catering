require 'rails_helper'

RSpec.describe OrderDetail, type: :model do

  before :each do
    @menu = create(:menu)
    @customer = create(:customer)
    @order = create(:order)
  end

  it'should belongs_to :menu' do
    expect(OrderDetail.reflect_on_association(:menu).macro).to eq :belongs_to
  end

end
