class Product < ApplicationRecord
  belongs_to :category

  has_many :order_details
  has_many :orders, through: :order_details

  has_attached_file :image, styles: { large:  '600x600>',
                                            medium: '300x300>',
                                            thumb:  '150x150#' }
  validates_attachment_content_type :image,
                                    content_type: %r{ /\Aimage\/.*Z/ }

  validates :name, :description, :price, :category_id, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: true
end
