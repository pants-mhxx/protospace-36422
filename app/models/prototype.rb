class Prototype < ApplicationRecord
  has_many　:user
  has_one_attached :image
end
