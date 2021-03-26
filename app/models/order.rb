class Order < ApplicationRecord
has_many :order_parathas, dependent: :destroy
has_many :parathas, through: :order_parathas
belongs_to :address
belongs_to :user
end
