class AddUidToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :uid, :string
  end
end
