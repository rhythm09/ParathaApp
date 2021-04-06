class OrderParatha < ApplicationRecord
  belongs_to :paratha
  belongs_to :order
  validates :quantity, numericality: true
  validates :price, numericality: true
end
