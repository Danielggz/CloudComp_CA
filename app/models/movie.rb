class Movie < ApplicationRecord
  validates :title, presence: { message: "Title is required" }
  # Year has to be a number and between 1900 and the current year
  validates :year,
  presence: { message: "Year is required" },
  numericality: {
    only_integer: true,
    message: "Year must be a valid number"
  }

  validate :year_in_valid_range

  private

  def year_in_valid_range
    return if year.blank?
    current_year = Time.current.year

    if year <= 1900
      errors.add(:year, "Year must be after 1900")
    elsif year >= current_year
      errors.add(:year, "must be less than #{current_year}")
    end
  end
end
