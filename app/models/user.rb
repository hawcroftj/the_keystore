class User < ApplicationRecord
  belongs_to :province

  has_many :orders

  validates :first_name, :last_name, :email, :address,
            :city, :post_code, :province_id, presence: true
end
