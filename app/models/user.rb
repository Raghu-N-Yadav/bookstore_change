class User < ApplicationRecord
  validates :email, presence: true, format: {with: /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/}, uniqueness: true
  validates :password, presence: true
  validates :confirm_password, presence: true
end
