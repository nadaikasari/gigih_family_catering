class Menu < ApplicationRecord
  has_many :item_categories
  has_many :order_details


end
