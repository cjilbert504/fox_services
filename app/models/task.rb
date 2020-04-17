class Task < ApplicationRecord
  belongs_to :list

  before_create do
     self.title = title.titlecase 
  end
  
end
