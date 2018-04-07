class Order < ApplicationRecord
  belongs_to :order_status, optional: true
  belongs_to :user, optional: true

  has_many :order_details
  has_many :products, through: :order_details

  validates :status_id, :user_id, presence: true
end
