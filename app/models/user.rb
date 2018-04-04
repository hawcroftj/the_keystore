class User < ApplicationRecord
  belongs_to :province

  has_many :orders

  validates :username, :password, :first_name, :last_name, :email, :address,
            :city, :post_code, :province_id, presence: true
  validates :username, :email, uniqueness: true

  # get :username as param for users/show instead of :id
  def to_param
    username
  end
end
