class Item < ApplicationRecord
  has_many :area_items, dependent: :destroy
  has_many :areas, through: :area_items
  # belongs_to :category
end
