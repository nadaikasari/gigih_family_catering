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

  it 'is valid with order_id, menu_id and quantity' do
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

  it 'is invalid without a quantity' do
    order_detail = FactoryBot.build(:order_detail, quantity: nil)

    order_detail.valid?

    expect(order_detail.errors[:quantity]).to include("can't be blank")
  end

  it 'is invalid quantity accept non numeric values' do
    order_detail = FactoryBot.build(:order_detail, quantity: "dua")
    
    order_detail.valid?
    
    expect(order_detail.errors[:quantity]).to include("is not a number")
  end

  it 'should count total, quantity * price' do
    order_detail = FactoryBot.create(:order_detail, quantity: 3, price: 2000.0)

    expect(order_detail.count_total_price).to eq(6000.0)
  end

  describe 'self#by_order_id' do
    context 'with matching id' do
      it "should return a array of results that match" do
        order1 = FactoryBot.create(:order_detail, order_id: 1, menu_id: 1)
        order2 = FactoryBot.create(:order_detail, order_id: 1, menu_id: 1)
  
        expect(OrderDetail.by_order_id(1)).to eq([order1, order2])
      end
    end
  end

end
