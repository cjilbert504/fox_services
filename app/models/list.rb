class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :employees, through: :tasks
end
