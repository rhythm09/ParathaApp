class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_parathas
  has_many :parathas, through: :cart_parathas
end
