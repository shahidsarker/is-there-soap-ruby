class Space < ApplicationRecord
  has_many :space_users, dependent: :destroy
  has_many :users, through: :space_users
  has_many :areas
end
