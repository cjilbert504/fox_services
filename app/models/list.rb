class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :employees, through: :tasks
  
  validates :name, presence: true
  validates :name, uniqueness: true

  def normalize_name
    self.name = name.strftime("%B %d, %Y")
  end

end
