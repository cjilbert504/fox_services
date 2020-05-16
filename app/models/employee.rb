class Employee < ApplicationRecord
 
  has_many :tasks
  has_many :lists, through: :tasks

  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end
