class Product < ApplicationRecord
  belongs_to :category

  has_many :order_details
  has_many :orders, through: :order_details

  validates :name, :description, :price, :category_id, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
end
