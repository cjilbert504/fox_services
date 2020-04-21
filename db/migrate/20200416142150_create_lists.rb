class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.date :name

      t.timestamps
    end
  end
end
