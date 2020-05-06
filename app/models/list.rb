class List < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :employees, through: :tasks
  
  validates :name, presence: true
  validates :name, uniqueness: true

  # scope :most_tasks, -> {List.joins(:tasks).select("lists.*, count(tasks.id) as tcount").group("lists.id").order("tcount DESC").limit(1)}

  def normalize_name
    self.name = name.strftime("%B %d, %Y")
  end

end
