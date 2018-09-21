class Area < ApplicationRecord
  belongs_to :space
  has_many :area_items, dependent: :destroy
  has_many :items, through: :area_items

  has_one_attached :image
end
