class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  # has_secure_password
  validates :password, confirmation: true
  validates :name, presence: true
  validates :email, format: { with: /[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+/ }
  validates :gender, presence: true
end
