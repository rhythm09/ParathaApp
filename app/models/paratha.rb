class Paratha < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: true
  validates :category, presence: true
end
