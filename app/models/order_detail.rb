class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :menu

  validates :order_id, presence: true
end
