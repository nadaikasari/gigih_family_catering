class Menu < ApplicationRecord
  has_many :item_category
  has_many :order_details
end
