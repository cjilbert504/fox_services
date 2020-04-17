class Task < ApplicationRecord
  belongs_to :list

  before_validation :normalize_title, :normalize_content, on: [:create, :update]
  
  private 

  def normalize_title 
    self.title = title.titlecase 
  end

  def normalize_content 
    self.content = content.capitalize 
  end

end
