class Movie < ApplicationRecord
  validates :title, presence: true
  # Year has to be a number and between 1900 and the current year
  validates :year, presence: true, 
  numericality: { 
    only_integer: true, 
    greater_than: 1900, 
    less_than: Time.current.year }
end
