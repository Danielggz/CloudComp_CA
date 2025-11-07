class RenameItemsBarcode < ActiveRecord::Migration[8.0]
  def change
    rename_column :items, :Barcode, :barcode
  end
end
