class List < ApplicationRecord
  has_many :tasks
  has_many :employees, through: :tasks
end
