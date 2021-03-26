class Paratha < ApplicationRecord
  has_many_attached :images
  has_many :cart_parathas
  has_many :carts, through: :cart_parathas
  validates :name, presence: true
  validates :price, numericality: true
  validates :category, presence: true
end
