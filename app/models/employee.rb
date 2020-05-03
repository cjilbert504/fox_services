class Employee < ApplicationRecord
 
  has_many :tasks
  has_many :lists, through: :tasks

  has_secure_password

  validates :name, :email, :phone_number, :password, presence: true
end
