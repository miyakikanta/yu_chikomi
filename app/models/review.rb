class Review < ApplicationRecord
  belongs_to :user
  belongs_to :onsen
  
  validates :score, presence: true
end
