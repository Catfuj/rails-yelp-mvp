class Review < ApplicationRecord
  ACCEPTED_RATINGS = (0..5).to_a

  belongs_to :restaurant

  validates :content, presence: true

  validates :rating,  presence: true, inclusion: { in: ACCEPTED_RATINGS }
  validates :rating,  numericality: { only_integer: true }
end
