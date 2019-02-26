class Review < ApplicationRecord
  belongs_to :session

  #RATES = %w(0 1 2 3 4 5)
  validates :content, presence: true
  #validates :rating,
  #         presence: true,
  #         inclusion: { in: RATES, message: "Please choose a rating between 0 to 5" }
end
