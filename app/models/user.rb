class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  validates :name, presence: true
  validates :lastname, presence: true
end
