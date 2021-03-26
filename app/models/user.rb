class User < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_secure_password
  validates :password, confirmation: true
  validates :name, presence: true
  validates :email, format: { with: /[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+/ }
  validates :gender, presence: true
end
