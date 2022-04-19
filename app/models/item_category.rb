class ItemCategory < ApplicationRecord
  belongs_to :menu
  belongs_to :category

  validates :menu_id, presence: true
  validates :category_id, presence: true

  def self.by_id(id)
    where("menu_id = #{id}").order(:menu_id)
  end
  
end
