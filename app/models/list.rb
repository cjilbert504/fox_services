class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :employees, through: :tasks

  before_validation :normalize_name, on: [:create, :update]
  
  validates :name, presence: true

  private 

  def normalize_name
    self.name = name.titlecase 
  end

end
