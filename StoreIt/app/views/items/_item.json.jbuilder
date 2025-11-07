json.extract! item, :id, :name, :category, :quantity, :location, :price, :expires, :expiryDate, :barcode, :created_at, :updated_at
json.url item_url(item, format: :json)
