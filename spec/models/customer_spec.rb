require 'rails_helper'

RSpec.describe Customer, type: :model do
  it'should have_many :order' do
      expect(Customer.reflect_on_association(:orders).macro).to eq :has_many
  end

  it 'is valid with a name, email and phone' do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  
end
