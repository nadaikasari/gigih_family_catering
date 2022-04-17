require 'rails_helper'

RSpec.describe Customer, type: :model do
  it'should have_many :order' do
      expect(Customer.reflect_on_association(:orders).macro).to eq :has_many
  end
end
