class Paratha < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  has_many :cart_parathas, dependent: :destroy
  has_many :carts, through: :cart_parathas
  has_many :order_parathas, dependent: :destroy
  has_many :orders, through: :order_parathas
  validates :name, presence: true
  validates :price, numericality: true
  validates :category, presence: true
end
