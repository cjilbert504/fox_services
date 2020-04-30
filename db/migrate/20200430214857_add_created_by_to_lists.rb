class AddCreatedByToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :created_by, :string
  end
end
