class Province < ApplicationRecord
  belongs_to :country

  has_many :users

  validates :name, :country_id, presence: true
  validates :pst_rate, :hst_rate, numericality: true
end
