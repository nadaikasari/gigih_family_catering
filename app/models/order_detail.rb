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

  def self.find_menu_name
    Menu.by_id(self.menu_id).each do |menu|
      return menu.name
    end
  end

  def count_total_price
    total = self.quantity * self.price
  end

  def self.by_order_id(id)
    where("order_id = #{id}").order(:order_id)
  end

end
