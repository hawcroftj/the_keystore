class Province < ApplicationRecord
  belongs_to :country

  has_many :users
  accepts_nested_attributes_for :users, allow_destroy: true

  validates :name, :country_id, presence: true
  validates :pst_rate, :hst_rate, numericality: true
end
