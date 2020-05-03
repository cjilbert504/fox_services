class Employee < ApplicationRecord
  # belongs_to :owner, optional: true
  has_many :tasks
  has_many :lists, through: :tasks

  has_secure_password

  validates :name, :email, :phone_number, :password, presence: true
end
