class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  validates :order_id, presence: true
  validates :menu_id, presence: true
  validates :quantity, presence: true, numericality: true

  before_create :find_menu_price

  def find_menu_price
    Menu.by_id(self.menu_id).each do |menu|
      self.price = menu.price.to_i
    end
  end

end
