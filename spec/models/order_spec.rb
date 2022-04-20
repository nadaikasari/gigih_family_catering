require 'rails_helper'

RSpec.describe Order, type: :model do
   it 'has a valid factory' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'is valid with a customer_id, total, order_date' do
    order = FactoryBot.build(:order)
    expect(order).to be_valid
  end

  it 'is invalid without a customer_id' do
    order = FactoryBot.build(:order, customer_id: nil)
    order.valid?
    expect(order.errors[:customer_id]).to include("can't be blank")
  end
end
