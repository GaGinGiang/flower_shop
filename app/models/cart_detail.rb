class CartDetail < ApplicationRecord
  belongs_to :flower
  has_many :order
end
