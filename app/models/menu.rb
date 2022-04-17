class Menu < ApplicationRecord
  has_many :item_categories
  has_many :order_details

  validates :name, presence: true
  validates :price, presence: true
  
end
