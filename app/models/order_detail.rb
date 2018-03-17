class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :product_quantity, :product_price, :tax_charged,
            :product_id, :order_id, presence: true
  validates :product_quantity, :product_price, :tax_charged, numericality: true
end
