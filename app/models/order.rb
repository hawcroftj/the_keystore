class Order < ApplicationRecord
  belongs_to :order_status, optional: true
  belongs_to :user, optional: true

  has_many :order_details
  has_many :products, through: :order_details

  validates :user_id, :total, :tax_total, presence: true
  validates :total, :tax_total, numericality: true
end
