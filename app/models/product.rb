class Product < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :title, presence: true
  validates :images, blob: { content_type: %w[image/png image/jpg image/jpeg] }

  has_many_attached :images do |attachable|
    attachable.variant :thumbnail, resize: "100x100"
    attachable.variant :large, resize: "250x250"
  end
end
