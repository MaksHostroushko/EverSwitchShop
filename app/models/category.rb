class Category < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :product_categories
  has_many :products, through: :product_categories
end
