class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.integer :number
      t.integer :code
      t.string :name
      t.string :lastname
      t.string :position

      t.timestamps
    end
  end
end
