class Flower < ApplicationRecord
  validates :description, :image, :price, presence: true
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 1.0}
  validates :image, format: {with: /\.(gif|jpg|png)\Z/i,
                             message: "Chi nhan file GIF, JPG, PNG"}
end
