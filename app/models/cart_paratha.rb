class CartParatha < ApplicationRecord
  belongs_to :paratha
  belongs_to :cart
  validates :quantity, numericality: true
end
