class Customer < ApplicationRecord
  validates :name, :lastname, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                             message: "invalid email address" }
  has_many :orders
  has_many :tickets, through: :orders
end
