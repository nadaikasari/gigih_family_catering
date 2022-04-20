require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  it'should belongs_to :menu' do
    expect(ItemCategory.reflect_on_association(:menu).macro).to eq :belongs_to
  end
end