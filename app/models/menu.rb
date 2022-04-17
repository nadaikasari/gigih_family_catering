class Menu < ApplicationRecord
  has_many :item_categories
  has_many :order_details

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0.01 }, numericality: true
  
end
