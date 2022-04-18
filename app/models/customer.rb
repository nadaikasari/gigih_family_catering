class Customer < ApplicationRecord
  has_many :orders

  validates :name, presence: true
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
  
end
