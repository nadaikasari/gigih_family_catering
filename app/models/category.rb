class Category < ApplicationRecord
  has_many :item_category

  validates :name, presence: true, uniqueness: true
  
end
