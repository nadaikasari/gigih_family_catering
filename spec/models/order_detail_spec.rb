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

  it'should belongs_to :order' do
    expect(OrderDetail.reflect_on_association(:order).macro).to eq :belongs_to
  end

  it 'is valid with order_id, menu_id, price and quantity' do
    expect(FactoryBot.build(:order_detail)).to be_valid
  end

  it 'is invalid without a order_id' do
    order_detail = FactoryBot.build(:order_detail, order_id: nil)

    order_detail.valid?

    expect(order_detail.errors[:order_id]).to include("can't be blank")
  end

  it 'is invalid without a menu_id' do
    order_detail = FactoryBot.build(:order_detail, menu_id: nil)

    order_detail.valid?

    expect(order_detail.errors[:menu_id]).to include("can't be blank")
  end

end
