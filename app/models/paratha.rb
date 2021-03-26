class Paratha < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  validates :name, presence: true
  validates :price, numericality: true
  validates :category, presence: true
end
