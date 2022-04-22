class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  validates :order_id, presence: true
  validates :menu_id, presence: true
  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true

  def total_price(name_menu)
    Menu.by_id(name_menu).each do |data_menu|
      return data_menu.price * quantity.to_i
    end
  end
  
end
