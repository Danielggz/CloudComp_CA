class Item < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 200, message: "has to be between 2 and 200 characters"}
  validates :category, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :location, presence: true, length: { minimum: 2 }, uniqueness: true
  validates :price, presence: true
  validates :barcode, presence: true, length: { is: 9 }, uniqueness:true
end
