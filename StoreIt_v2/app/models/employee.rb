class Employee < ApplicationRecord
  validates :number, presence: true, uniqueness: true
  validates :code, presence: true
  validates :name, presence: true
  validates :lastname, presence: true
end
