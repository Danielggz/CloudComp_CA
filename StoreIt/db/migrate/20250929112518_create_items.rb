class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.integer :id
      t.string :name
      t.string :category
      t.integer :quantity
      t.string :location
      t.float :price
      t.boolean :expires
      t.date :expiryDate

      t.timestamps
    end
  end
end
