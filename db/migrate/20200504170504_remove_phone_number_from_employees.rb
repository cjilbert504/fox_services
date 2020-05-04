class RemovePhoneNumberFromEmployees < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :phone_number
  end
end
