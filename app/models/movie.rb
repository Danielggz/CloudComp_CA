class Movie < ApplicationRecord
  validates :title, presence: { message: "Title is required" }
  # Year has to be a number and between 1900 and the current year
  validates :year, presence: { message: "Year is required" },
  numericality: {
    only_integer: true,
    message: "Year must be a valid number",
    greater_than: 1900,
    less_than: Time.current.year,
    greater_than_message: "Year must be after 1900",
    less_than_message: "Year cannot be in the future"
  }
end
