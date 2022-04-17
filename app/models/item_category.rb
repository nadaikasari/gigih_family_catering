class ItemCategory < ApplicationRecord
  belongs_to :menu
  belongs_to :categories

  validates :menu_id, presence: true
  validates :category_id, presence: true
  
end
