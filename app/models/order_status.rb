class OrderStatus < ApplicationRecord
  has_many :orders

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
