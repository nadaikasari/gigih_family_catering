require 'rails_helper'

RSpec.describe Customer, type: :model do
  it'should have_many :order' do
      expect(Customer.reflect_on_association(:orders).macro).to eq :has_many
  end

  it 'is valid with a name, email and phone' do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  it 'is invalid without a name and email' do
    customer = FactoryBot.build(:invalid_customer)

    customer.valid?

    expect(customer.errors[:name]).to include("can't be blank")
    expect(customer.errors[:email]).to include("can't be blank")
  end

  it 'is valid email with the correct format' do
    customer = FactoryBot.build(:customer, email: "nadaikasari@gmail.com")

    customer.valid?

    expect(FactoryBot.build(:customer)).to be_valid
  end

  it 'is invalid email with wrong format' do
    customer = FactoryBot.build(:customer, email: "nadaikasari@gmail")

    customer.valid?

    expect(customer.errors[:email]).to include("is invalid")
  end

  describe 'self#by_letter' do
    context 'with matching letter' do
      it "should return a sorted array of results that match" do
        customer1 = FactoryBot.create(:customer, name: 'Nada')
        customer2 = FactoryBot.create(:customer, name: 'Ika')
        customer3 = FactoryBot.create(:customer, name: 'Nadia')
  
        expect(Customer.by_letter("N")).to eq([customer1, customer3])
      end
    end
  end
  
end
