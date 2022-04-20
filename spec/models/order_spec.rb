require 'rails_helper'

RSpec.describe Order, type: :model do

    before :each do
        @customer = create(:customer)
    end

    it'should belongs_to :customer' do
        expect(Order.reflect_on_association(:customer).macro).to eq :belongs_to
    end

    it'should have_many :order_details' do
        expect(Order.reflect_on_association(:order_details).macro).to eq :has_many
    end
  
    it 'is valid with a customer_id, order_date and status' do
        expect(FactoryBot.build(:order)).to be_valid
    end

    it 'is invalid without a customer id' do
        order = FactoryBot.build(:order, customer_id: nil)
    
        order.valid?
    
        expect(order.errors[:customer_id]).to include("can't be blank")
    end
end
