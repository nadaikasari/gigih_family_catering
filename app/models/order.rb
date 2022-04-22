class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details

  validates :customer_id, presence: true

  def find_customer
    Customer.by_id(id).each do |menu|
      return menu.price
    end
  end

  def find_menu_price(id)
    Menu.by_id(id).each do |menu|
      return menu.price
    end
  end
  
  def total_price
    price.to_i * quantity.to_i
  end
end
