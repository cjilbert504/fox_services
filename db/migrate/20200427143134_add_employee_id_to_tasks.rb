class AddEmployeeIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :employee_id, :integer, default: nil
  end
end
