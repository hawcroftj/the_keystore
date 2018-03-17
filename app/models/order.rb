class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :user

  has_many :order_details
  has_many :products, through: :order_details

  validates :status_id, :user_id, presence: true
end
