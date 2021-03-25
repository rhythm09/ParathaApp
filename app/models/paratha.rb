class Paratha < ApplicationRecord
  has_many_attached :images
  has_and_belongs_to_many :carts
  validates :name, presence: true
  validates :price, numericality: true
  validates :category, presence: true
end
