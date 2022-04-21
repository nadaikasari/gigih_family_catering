class Menu < ApplicationRecord
  has_many :catgories
  has_many :order_details

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0.01 }, numericality: true
  validates :description, length: {maximum: 150}
  validates :categories, presence: true

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
  
end
